import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/kt.dart';

import 'package:highlights/domain/authentication/user.dart';
import 'package:highlights/domain/core/errors.dart';
import 'package:highlights/domain/core/value_objects.dart';
import 'package:highlights/domain/highlights/highlight_search_filter.dart';
import 'package:highlights/domain/highlights/value_objects.dart';
import 'package:highlights/domain/highlights/image.dart';
import 'package:highlights/domain/authentication/i_auth_facade.dart';
import 'package:highlights/domain/highlights/highlight.dart';
import 'package:highlights/domain/highlights/highlight_failure.dart';
import 'package:highlights/infrastructure/highlight/highlight_repository.dart';

const mockUid = 'mock-uid';
const highlightsPath = 'highlights';
const usersPath = 'users';
const mockData = {
  'color': 4294747063,
  'image': {
    'url': 'https://test-url.test',
    'path': 'test/path/to/file',
  },
  'quote': 'Test quote',
  'bookTitle': 'Test title',
  'pageNumber': '666',
};
const fakeDownloadUrl = 'https://fake-download-url.fake';
final mockHighlight = Highlight(
  id: UniqueId.fromUniqueString(mockUid),
  color: HighlightColor(HighlightColor.predefinedColors[2]),
  quote: HighlightQuote('Test quote'),
  image: some(
    Image(
      imageUrl: some(ImageUrl('https://test-url.test')),
      imageFile: some(ImageFile(File('test/path/to/file'))),
    ),
  ),
  bookTitle: BookTitle('Test title'),
  pageNumber: PageNumber('666'),
);

class MockIAuthFacade extends Mock implements IAuthFacade {}

// ignore: avoid_implementing_value_types
class FakeFirebaseStorage extends Fake implements FirebaseStorage {
  @override
  Reference ref([String path]) {
    return FakeReference();
  }
}

// ignore: avoid_implementing_value_types
class FakeFailedFirebaseStorage extends Fake implements FirebaseStorage {
  @override
  Reference ref([String path]) {
    return FakeFailedReference();
  }
}

// ignore: avoid_implementing_value_types
class FakeReference extends Fake implements Reference {
  @override
  UploadTask putFile(File file, [SettableMetadata metadata]) {
    return FakeUploadTask();
  }

  @override
  Reference child(String path) {
    return FakeReference();
  }

  @override
  Future<String> getDownloadURL() => Future.value(fakeDownloadUrl);

  @override
  Future<void> delete() => Future.value();
}

// ignore: avoid_implementing_value_types
class FakeFailedReference extends Fake implements Reference {
  @override
  UploadTask putFile(File file, [SettableMetadata metadata]) {
    return FakeUploadTask();
  }

  @override
  Reference child(String path) {
    return FakeFailedReference();
  }

  @override
  Future<String> getDownloadURL() => Future.value(fakeDownloadUrl);

  @override
  Future<void> delete() => throw FirebaseException(
        plugin: 'any',
        code: 'not-found',
        message: 'any',
      );
}

class FakeUploadTask extends Fake implements UploadTask {
  @override
  TaskSnapshot get snapshot {
    return FakeTaskSnapshot();
  }

  @override
  Future<S> then<S>(
    FutureOr<S> Function(TaskSnapshot) onValue, {
    Function onError,
  }) =>
      Future.value(onValue(snapshot));
}

// ignore: avoid_implementing_value_types
class FakeTaskSnapshot extends Fake implements TaskSnapshot {
  @override
  TaskState get state => TaskState.success;
}

void main() {
  MockFirestoreInstance mockFirestore;
  FakeFirebaseStorage fakeFirebaseStorage;
  FakeFailedFirebaseStorage fakeFailedFirebaseStorage;
  MockIAuthFacade mockIAuthFacade;
  HighlightRepository highlightRepository;
  StreamSubscription<Either<HighlightFailure, KtList<Highlight>>> subscription;

  setUp(() {
    mockFirestore = MockFirestoreInstance();
    mockFirestore
        .collection(usersPath)
        .doc(mockUid)
        .collection(highlightsPath)
        .doc(mockUid)
        .set(mockData);
    fakeFirebaseStorage = FakeFirebaseStorage();
    fakeFailedFirebaseStorage = FakeFailedFirebaseStorage();
    mockIAuthFacade = MockIAuthFacade();
    highlightRepository = HighlightRepository(
      mockFirestore,
      fakeFirebaseStorage,
      mockIAuthFacade,
    );
  });

  tearDown(() async {
    await subscription?.cancel();
  });

  // Clean and simplify data before expect()
  String getClearDumpAsString() {
    return mockFirestore
        .dump()
        .replaceAll(RegExp(r'\s+'), '')
        // ignore: unnecessary_raw_strings
        .replaceAll(RegExp(r'(,"serverTimestamp").+?(?=})'), '');
  }

  Future<void> deleteDB() async {
    return mockFirestore
        .collection(usersPath)
        .doc(mockUid)
        .collection(highlightsPath)
        .doc(mockUid)
        .delete();
  }

  final mockUser = User(
    id: UniqueId.fromUniqueString(mockUid),
    emailVerified: false,
  );

  group('watchAll', () {
    test(
      '\nGiven no highlights in DB'
      '\nWhen stream is listened'
      '\nThen emitt a Stream with Right with an empty KtList',
      () async {
        when(mockIAuthFacade.getSignedInUser()).thenReturn(
          some(mockUser),
        );

        await deleteDB();

        subscription = highlightRepository.watchAll().listen(
          expectAsync1(
            (failureOrHighlights) {
              expect(
                failureOrHighlights.isRight(),
                isTrue,
                reason: 'failureOrHighlights is Left',
              );
              failureOrHighlights.fold(
                (_) {},
                (highlights) {
                  expect(
                    highlights.size,
                    isZero,
                    reason: 'highlights.size is not zero',
                  );
                },
              );
            },
          ),
        );

        // TODO: why is not recognizing the call?
        // verify(mockIAuthFacade.getSignedInUser()).called(1);
      },
    );

    test(
      '\nGiven unauthenticated user'
      '\nWhen watchAll() is called'
      '\nThen throw NotAuthenticatedError',
      () async {
        when(mockIAuthFacade.getSignedInUser()).thenReturn(none());

        subscription = highlightRepository.watchAll().listen(
          expectAsync1((_) {}, count: 0),
          onError: (e) {
            expect(e, isA<NotAuthenticatedError>());
          },
        );

        // TODO: why is not recognizing the call?
        // verify(mockIAuthFacade.getSignedInUser()).called(1);
      },
    );

    test(
      '\nGiven 1 highlight in DB'
      '\nWhen stream is listened'
      '\nThen emitt a Stream with Right with a KtList holding the Highlight',
      () async {
        when(mockIAuthFacade.getSignedInUser()).thenReturn(
          some(mockUser),
        );

        subscription = highlightRepository.watchAll().listen(
          expectAsync1(
            (failureOrHighlights) {
              expect(
                failureOrHighlights.isRight(),
                isTrue,
                reason: 'failureOrHighlights is Left',
              );
              failureOrHighlights.fold(
                (_) {},
                (highlights) {
                  expect(
                    highlights.size,
                    equals(1),
                    reason: 'highlights.size is not 1',
                  );
                  // Test Strings because equals() doesn't seems to compare
                  // value equality with nested objects
                  expect(
                    highlights[0].toString(),
                    equals(mockHighlight.toString()),
                    reason: 'exceptec highlight is not equal to mockHighlight',
                  );
                },
              );
            },
          ),
        );

        // TODO: why is not recognizing the call?
        // verify(mockIAuthFacade.getSignedInUser()).called(1);
      },
    );

    test(
      '\nGiven 1 failed highlight in DB'
      '\nWhen stream is listened'
      '\nThen emitt a Stream with Right with a KtList holding the failed Highlight with its failure',
      () async {
        when(mockIAuthFacade.getSignedInUser()).thenReturn(
          some(mockUser),
        );

        mockFirestore
            .collection(usersPath)
            .doc(mockUid)
            .collection(highlightsPath)
            .add(
          {
            'id': 'new-id',
            'color': 4294892630,
            'image': {
              'url': '',
              'path': '',
            },
            'quote': '',
            'bookTitle': '',
            'pageNumber': '-1',
            'serverTimestamp': 1613512300,
          },
        );

        subscription = highlightRepository.watchAll().listen(
          expectAsync1(
            (failureOrHighlights) {
              expect(
                failureOrHighlights.isRight(),
                isTrue,
                reason: 'failureOrHighlights is Left',
              );
              failureOrHighlights.fold(
                (_) {},
                (highlights) {
                  expect(
                    highlights.size,
                    equals(2),
                    reason: 'highlights.size is not 2',
                  );
                  final failedHighlights = highlights.filter((highlight) {
                    return highlight.failureOption.isSome();
                  });
                  expect(
                    failedHighlights.size,
                    equals(1),
                    reason: 'no Highlight with failures',
                  );
                },
              );
            },
          ),
        );

        // TODO: why is not recognizing the call?
        // verify(mockIAuthFacade.getSignedInUser()).called(1);
      },
    );

    test(
      '\nGiven unexpected error'
      '\nWhen stream is listened'
      '\nThen emitt a Stream with Left holding HighlightFailure.unexpected()',
      () async {
        when(mockIAuthFacade.getSignedInUser()).thenReturn(
          some(mockUser),
        );

        mockFirestore
            .collection(usersPath)
            .doc(mockUid)
            .collection(highlightsPath)
            .add({'invalidField': 'invalidValue'});

        subscription = highlightRepository.watchAll().listen(
          expectAsync1(
            (failureOrHighlights) {
              expect(
                failureOrHighlights.isLeft(),
                isTrue,
                reason: 'failureOrHighlights is Right',
              );
              failureOrHighlights.fold(
                (failure) {
                  expect(
                    failure,
                    HighlightFailure.unexpected(
                      details:
                          'Error while calling HighlightRepository.watchAll() in ${mockFirestore.collection(usersPath).doc(mockUid)}',
                    ),
                  );
                },
                (_) {},
              );
            },
          ),
        );

        // TODO: why is not recognizing the call?
        // verify(mockIAuthFacade.getSignedInUser()).called(1);
      },
    );
  });

  group('watchFiltered', () {
    test(
      '\nGiven no highlights in DB'
      '\nWhen stream is listened'
      '\nThen emitt a Stream with Right with an empty KtList',
      () async {
        when(mockIAuthFacade.getSignedInUser()).thenReturn(
          some(mockUser),
        );

        await deleteDB();

        subscription = highlightRepository
            .watchFiltered(HighlightSearchFilter.initial())
            .listen(
          expectAsync1(
            (failureOrHighlights) {
              expect(
                failureOrHighlights.isRight(),
                isTrue,
                reason: 'failureOrHighlights is Left',
              );
              failureOrHighlights.fold(
                (_) {},
                (highlights) {
                  expect(
                    highlights.size,
                    isZero,
                    reason: 'highlights.size is not zero',
                  );
                },
              );
            },
          ),
        );

        // TODO: why is not recognizing the call?
        // verify(mockIAuthFacade.getSignedInUser()).called(1);
      },
    );

    test(
      '\nGiven unauthenticated user'
      '\nWhen watchFiltered() is called'
      '\nThen throw NotAuthenticatedError',
      () async {
        when(mockIAuthFacade.getSignedInUser()).thenReturn(none());

        subscription = highlightRepository
            .watchFiltered(HighlightSearchFilter.initial())
            .listen(
          expectAsync1((_) {}, count: 0),
          onError: (e) {
            expect(e, isA<NotAuthenticatedError>());
          },
        );

        // TODO: why is not recognizing the call?
        // verify(mockIAuthFacade.getSignedInUser()).called(1);
      },
    );

    // test(
    //   '\nGiven multiple highlights in DB'
    //   '\nWhen stream is filtered with showOnlyIfHasImage'
    //   '\nThen emitt a Stream with Right with a KtList holding the correct Highlight',
    //   () async {
    //     when(mockIAuthFacade.getSignedInUser()).thenReturn(
    //       some(
    //         mockUser
    //       ),
    //     );

    //     mockFirestore
    //         .collection(usersPath)
    //         .doc(mockUid)
    //         .collection(highlightsPath)
    //         .add(
    //       {
    //         'id': 'new-id',
    //         'color': 4294892630,
    //         'imageUrl': '',
    //         'quote': 'Test quote 2',
    //         'bookTitle': 'new book',
    //         'pageNumber': 666,
    //         'serverTimestamp': 1613512300,
    //       },
    //     );

    //     // TODO: problem with Firestore mock? Error: Unsopported
    //     subscription = highlightRepository
    //         .watchFiltered(HighlightSearchFilter.initial()
    //             .copyWith(showOnlyIfHasImage: true))
    //         .listen(
    //       expectAsync1(
    //         (failureOrHighlights) {
    //           expect(
    //             failureOrHighlights.isRight(),
    //             isTrue,
    //             reason: 'failureOrHighlights is Left',
    //           );
    //           failureOrHighlights.fold(
    //             (_) {},
    //             (highlights) {
    //               expect(
    //                 highlights.size,
    //                 equals(1),
    //                 reason: 'highlights.size is not 1',
    //               );
    //               highlights.map((highlight) {
    //                 expect(highlight, equals(mockHighlight));
    //               });
    //             },
    //           );
    //         },
    //       ),
    //     );

    //     // TODO: why is not recognizing the call?
    //     // verify(mockIAuthFacade.getSignedInUser()).called(1);
    //   },
    // );

    test(
      '\nGiven multiple highlights in DB'
      '\nWhen stream is filtered without showOnlyIfHasImage'
      '\nThen emitt a Stream with Right with a KtList holding all the items',
      () async {
        when(mockIAuthFacade.getSignedInUser()).thenReturn(
          some(mockUser),
        );

        mockFirestore
            .collection(usersPath)
            .doc(mockUid)
            .collection(highlightsPath)
            .add(
          {
            'id': 'new-id',
            'color': 4294892630,
            'image': {
              'url': '',
              'path': '',
            },
            'quote': 'Test quote 2',
            'bookTitle': 'new book',
            'pageNumber': '666',
            'serverTimestamp': 1613512300,
          },
        );

        subscription = highlightRepository
            .watchFiltered(HighlightSearchFilter.initial())
            .listen(
          expectAsync1(
            (failureOrHighlights) {
              expect(
                failureOrHighlights.isRight(),
                isTrue,
                reason: 'failureOrHighlights is Left',
              );
              failureOrHighlights.fold(
                (_) {},
                (highlights) {
                  expect(
                    highlights.size,
                    equals(2),
                    reason: 'highlights.size is not 2',
                  );
                },
              );
            },
          ),
        );

        // TODO: why is not recognizing the call?
        // verify(mockIAuthFacade.getSignedInUser()).called(1);
      },
    );

    test(
      '\nGiven unexpected error'
      '\nWhen stream is listened'
      '\nThen emitt a Stream with Left holding HighlightFailure.unexpected()',
      () async {
        when(mockIAuthFacade.getSignedInUser()).thenReturn(
          some(mockUser),
        );

        mockFirestore
            .collection(usersPath)
            .doc(mockUid)
            .collection(highlightsPath)
            .add({'invalidField': 'invalidValue', 'bookTitle': 'title'});

        subscription = highlightRepository
            .watchFiltered(HighlightSearchFilter.initial())
            .listen(
          expectAsync1(
            (failureOrHighlights) {
              expect(
                failureOrHighlights.isLeft(),
                isTrue,
                reason: 'failureOrHighlights is Right',
              );
              failureOrHighlights.fold(
                (failure) {
                  expect(
                    failure,
                    equals(HighlightFailure.unexpected(
                      details:
                          'Error while calling HighlightRepository.watchFiltered() in ${mockFirestore.collection(usersPath).doc(mockUid)}/${mockFirestore.collection(usersPath).doc(mockUid).collection(highlightsPath)} with ${HighlightSearchFilter.initial()}',
                    )),
                  );
                },
                (_) {},
              );
            },
          ),
        );

        // TODO: why is not recognizing the call?
        // verify(mockIAuthFacade.getSignedInUser()).called(1);
      },
    );
  });

  group('create', () {
    final newHighlight = Highlight(
      id: UniqueId.fromUniqueString('new-uid'),
      color: HighlightColor(HighlightColor.predefinedColors[4]),
      quote: HighlightQuote('New inspirational quote'),
      image: some(
        Image(
          imageUrl: none(),
          imageFile: some(ImageFile(File('new/path/to/file'))),
        ),
      ),
      bookTitle: BookTitle('Brand new book title'),
      pageNumber: PageNumber('999'),
    );

    test(
      '\nGiven unauthenticated user'
      '\nWhen create() is called'
      '\nThen throw NotAuthenticatedError',
      () async {
        when(mockIAuthFacade.getSignedInUser()).thenReturn(none());

        expect(
          highlightRepository.create(newHighlight),
          throwsA(isInstanceOf<NotAuthenticatedError>()),
        );

        verify(mockIAuthFacade.getSignedInUser()).called(1);
      },
    );

    test(
      '\nGiven highlights in DB'
      '\nWhen a new is created'
      '\nThen return right() with Unit and update DB',
      () async {
        when(mockIAuthFacade.getSignedInUser()).thenReturn(
          some(mockUser),
        );

        final failureOrUnit = await highlightRepository.create(newHighlight);

        expect(failureOrUnit.isRight(), isTrue);

        failureOrUnit.fold(
          (_) => {},
          (u) => expect(u, unit),
        );

        final actual = getClearDumpAsString();

        final expected = '''
          {
            "users": {
              "$mockUid": {
                "highlights": {
                  "$mockUid": {
                    "color": 4294747063,
                    "image": {
                      "url": "https://test-url.test",
                      "path": "test/path/to/file"
                    },
                    "quote": "Test quote",
                    "bookTitle": "Test title",
                    "pageNumber": "666"
                  },
                  "new-uid": {
                    "quote": "New inspirational quote",
                    "color": 4292197112,
                    "image": {
                      "url": "$fakeDownloadUrl",
                      "path": "new/path/to/file"
                    },
                    "bookTitle": "Brand new book title",
                    "pageNumber": "999"
                  }
                }
              }
            }
          }
          '''
            .replaceAll(RegExp(r'\s+'), '');

        expect(
          actual,
          expected,
        );

        verify(mockIAuthFacade.getSignedInUser()).called(1);
      },
    );

    test(
      '\nGiven no highlights in DB'
      '\nWhen a new is created'
      '\nThen return right() with Unit and update DB',
      () async {
        when(mockIAuthFacade.getSignedInUser()).thenReturn(
          some(mockUser),
        );

        await deleteDB();

        final failureOrUnit = await highlightRepository.create(newHighlight);

        expect(failureOrUnit.isRight(), isTrue);

        failureOrUnit.fold(
          (_) => {},
          (u) => expect(u, unit),
        );

        final collection = await mockFirestore
            .collection(usersPath)
            .doc(mockUid)
            .collection(highlightsPath)
            .get();

        final dataMapList = collection.docs.map((e) => e.data()).toList();

        // Partial and indirect evaluations because mockFirestore.dump()
        // is not updated right after delete(), so we need to access to
        // current data as Snapshots
        expect(dataMapList.length, 1);
        expect(dataMapList[0]['quote'], 'New inspirational quote');
        // ignore: avoid_dynamic_calls
        expect(dataMapList[0]['image']['url'], fakeDownloadUrl);

        verify(mockIAuthFacade.getSignedInUser()).called(1);
      },
    );
  });

  group('update', () {
    final updatedHighlight = mockHighlight.copyWith(
      color: HighlightColor(HighlightColor.predefinedColors[3]),
      quote: HighlightQuote('Test quote updated'),
      image: some(
        Image(
          imageUrl: some(ImageUrl('https://test-url-updated.test')),
          imageFile: some(ImageFile(File('test-file'))),
        ),
      ),
      bookTitle: BookTitle('Test title updated'),
      pageNumber: PageNumber('777'),
    );

    test(
      '\nGiven unauthenticated user'
      '\nWhen update() is called'
      '\nThen throw NotAuthenticatedError',
      () async {
        when(mockIAuthFacade.getSignedInUser()).thenReturn(none());

        expect(
          highlightRepository.update(updatedHighlight),
          throwsA(isInstanceOf<NotAuthenticatedError>()),
        );

        verify(mockIAuthFacade.getSignedInUser()).called(1);
      },
    );

    test(
      '\nGiven a highlight in DB'
      '\nWhen it is updated'
      '\nThen return right() with Unit and update DB',
      () async {
        when(mockIAuthFacade.getSignedInUser()).thenReturn(
          some(mockUser),
        );

        final failureOrUnit =
            await highlightRepository.update(updatedHighlight);

        expect(failureOrUnit.isRight(), isTrue);

        failureOrUnit.fold(
          (_) => {},
          (u) => expect(u, unit),
        );

        final actual = getClearDumpAsString();

        final expected = '''
          {
            "users": {
              "$mockUid": {
                "highlights": {
                  "$mockUid": {
                    "color": 4291883200,
                    "image": {
                      "url": "https://test-url-updated.test",
                      "path": "test-file"
                    },
                    "quote": "Test quote updated",
                    "bookTitle": "Test title updated",
                    "pageNumber": "777"
                  }
                }
              }
            }
          }
          '''
            .replaceAll(RegExp(r'\s+'), '');

        expect(
          actual,
          expected,
        );

        verify(mockIAuthFacade.getSignedInUser()).called(1);
      },
    );

    test(
      '\nGiven existent highlights document in DB'
      '\nWhen trying to update a non-existent Highlight'
      '\nThen return right() with unit and create new Highlight in DB',
      () async {
        when(mockIAuthFacade.getSignedInUser()).thenReturn(
          some(mockUser),
        );

        final failureOrUnit = await highlightRepository.update(
          updatedHighlight.copyWith(
            id: UniqueId.fromUniqueString('non-existent-id'),
          ),
        );

        expect(
          failureOrUnit.isRight(),
          isTrue,
          reason: 'failureOrUnit is Left',
        );

        failureOrUnit.fold(
          (_) => {},
          (u) => expect(u, unit),
        );

        final actual = getClearDumpAsString();

        final expected = '''
          {
            "users": {
              "$mockUid": {
                "highlights": {
                  "$mockUid": {
                    "color": 4294747063,
                    "image": {
                      "url": "https://test-url.test",
                      "path": "test/path/to/file"
                    },
                    "quote": "Test quote",
                    "bookTitle": "Test title",
                    "pageNumber": "666"
                  },
                  "non-existent-id": {
                    "quote": "Test quote updated",
                    "color": 4291883200,
                    "image": {
                      "url": "https://test-url-updated.test",
                      "path": "test-file"
                    },
                    "bookTitle": "Test title updated",
                    "pageNumber": "777"
                  }
                }
              }
            }
          }
          '''
            .replaceAll(RegExp(r'\s+'), '');

        expect(
          actual,
          expected,
        );

        verify(mockIAuthFacade.getSignedInUser()).called(1);
      },
    );

    // TODO: updating a non-existent document seems succeed (!)
    // I have no way to test a failed case
  });

  group('delete', () {
    test(
      '\nGiven unauthenticated user'
      '\nWhen update() is called'
      '\nThen throw NotAuthenticatedError',
      () async {
        when(mockIAuthFacade.getSignedInUser()).thenReturn(none());

        expect(
          highlightRepository.delete(mockHighlight),
          throwsA(isInstanceOf<NotAuthenticatedError>()),
        );

        verify(mockIAuthFacade.getSignedInUser()).called(1);
      },
    );

    test(
      '\nGiven a highlight in DB'
      '\nWhen it is deleted'
      '\nThen return right() with Unit and update DB',
      () async {
        when(mockIAuthFacade.getSignedInUser()).thenReturn(
          some(mockUser),
        );

        final failureOrUnit = await highlightRepository.delete(mockHighlight);

        expect(failureOrUnit.isRight(), isTrue);

        failureOrUnit.fold(
          (_) => {},
          (u) => expect(u, unit),
        );

        final collection = await mockFirestore
            .collection(usersPath)
            .doc(mockUid)
            .collection(highlightsPath)
            .get();

        expect(collection.docs.isEmpty, isTrue);

        verify(mockIAuthFacade.getSignedInUser()).called(1);
      },
    );

    test(
      '\nGiven existent highlights document in DB'
      '\nWhen trying to delete a non-existent Highlight'
      '\nThen return right() with unit and DB stays the same',
      () async {
        when(mockIAuthFacade.getSignedInUser()).thenReturn(
          some(mockUser),
        );

        final failureOrUnit = await highlightRepository.delete(
          mockHighlight.copyWith(
            id: UniqueId.fromUniqueString('non-existent-id'),
          ),
        );

        expect(
          failureOrUnit.isRight(),
          isTrue,
          reason: 'failureOrUnit is Left',
        );

        failureOrUnit.fold(
          (_) => {},
          (u) => expect(u, unit),
        );

        final actual = getClearDumpAsString();

        final expected = '''
          {
            "users": {
              "$mockUid": {
                "highlights": {
                  "$mockUid": {
                    "color": 4294747063,
                    "image": {
                      "url": "https://test-url.test",
                      "path": "test/path/to/file"
                    },
                    "quote": "Test quote",
                    "bookTitle": "Test title",
                    "pageNumber": "666"
                  }
                }
              }
            }
          }
          '''
            .replaceAll(RegExp(r'\s+'), '');

        expect(
          actual,
          expected,
        );

        verify(mockIAuthFacade.getSignedInUser()).called(1);
      },
    );

    // TODO: deleting a non-existent document seems succeed (!)
    // I have no way to test a failed case

    // TODO: test against fake data stored in storage
    group('deleteImage', () {
      final highlight = Highlight(
        id: UniqueId.fromUniqueString('new-uid'),
        color: HighlightColor(HighlightColor.predefinedColors[4]),
        quote: HighlightQuote('New inspirational quote'),
        image: some(
          Image(
            imageUrl: some(ImageUrl('https://test-url.test')),
            imageFile: some(ImageFile(File('new/path/to/file'))),
          ),
        ),
        bookTitle: BookTitle('Brand new book title'),
        pageNumber: PageNumber('999'),
      );

      test(
        '\nGiven unauthenticated user'
        '\nWhen deleteImage() is called'
        '\nThen throw NotAuthenticatedError',
        () async {
          when(mockIAuthFacade.getSignedInUser()).thenReturn(none());

          expect(
            highlightRepository.deleteImage(highlight),
            throwsA(isInstanceOf<NotAuthenticatedError>()),
          );

          verify(mockIAuthFacade.getSignedInUser()).called(1);
        },
      );

      test(
        '\nGiven image in Storage'
        "\nWhen it's deleted succesfully"
        '\nThen return right() with Unit',
        () async {
          when(mockIAuthFacade.getSignedInUser()).thenReturn(
            some(mockUser),
          );

          final failureOrUnit =
              await highlightRepository.deleteImage(highlight);

          expect(failureOrUnit.isRight(), isTrue);

          failureOrUnit.fold(
            (_) => {},
            (u) => expect(u, unit),
          );

          verify(mockIAuthFacade.getSignedInUser()).called(1);
        },
      );

      // TODO: find a way to test all the failed cases without usinf Fake,
      // because it's unmaintanible
      test(
        '\nGiven no reference to image in Storage'
        '\nWhen try to delete it'
        '\nThen left with _UnableToUpdate failure',
        () async {
          when(mockIAuthFacade.getSignedInUser()).thenReturn(
            some(mockUser),
          );

          final failedHighlightRepository = HighlightRepository(
            mockFirestore,
            fakeFailedFirebaseStorage,
            mockIAuthFacade,
          );

          final failureOrUnit =
              await failedHighlightRepository.deleteImage(highlight);

          expect(failureOrUnit.isLeft(), isTrue);

          failureOrUnit.fold(
            (failure) => expect(
              failure,
              const HighlightFailure.unableToUpdate(),
            ),
            (_) => {},
          );

          verify(mockIAuthFacade.getSignedInUser()).called(1);
        },
      );
    });
  });
}
