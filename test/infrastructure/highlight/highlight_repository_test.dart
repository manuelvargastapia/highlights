import 'dart:async';

import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/kt.dart';

import 'package:highlights/domain/authentication/user.dart';
import 'package:highlights/domain/core/errors.dart';
import 'package:highlights/domain/core/value_objects.dart';
import 'package:highlights/domain/highlights/highlight_search_filter.dart';
import 'package:highlights/domain/highlights/value_objects.dart';
import 'package:highlights/domain/authentication/i_auth_facade.dart';
import 'package:highlights/domain/highlights/highlight.dart';
import 'package:highlights/domain/highlights/highlight_failure.dart';
import 'package:highlights/infrastructure/highlight/highlight_repository.dart';

const mockUid = 'mock-uid';
const highlightsPath = 'highlights';
const usersPath = 'users';
const mockData = {
  'color': 4294892630,
  'imageUrl': 'https://test-url.test',
  'quote': 'Test quote',
  'bookTitle': 'Test title',
  'pageNumber': 666,
};
final mockHighlight = Highlight(
  id: UniqueId.fromUniqueString(mockUid),
  color: HighlightColor(HighlightColor.predefinedColors[2]),
  quote: HighlightQuote('Test quote'),
  imageUrl: ImageUrl('https://test-url.test'),
  bookTitle: BookTitle('Test title'),
  pageNumber: QuotePage(666),
);

class MockIAuthFacade extends Mock implements IAuthFacade {}

void main() {
  MockFirestoreInstance mockFirestore;
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
    mockIAuthFacade = MockIAuthFacade();
    highlightRepository = HighlightRepository(mockFirestore, mockIAuthFacade);
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

  group('watchAll', () {
    test(
      '\nGiven no highlights in DB'
      '\nWhen stream is listened'
      '\nThen emitt a Stream with Right with an empty KtList',
      () async {
        when(mockIAuthFacade.getSignedInUser()).thenReturn(
          some(
            User(id: UniqueId.fromUniqueString(mockUid)),
          ),
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
          some(
            User(id: UniqueId.fromUniqueString(mockUid)),
          ),
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
                  highlights.map((highlight) {
                    expect(
                      highlight,
                      equals(mockHighlight),
                      reason:
                          'exceptec highlight is not equal to mockHighlight',
                    );
                  });
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
          some(
            User(id: UniqueId.fromUniqueString(mockUid)),
          ),
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
                  expect(failure, equals(const HighlightFailure.unexpected()));
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
          some(
            User(id: UniqueId.fromUniqueString(mockUid)),
          ),
        );

        await deleteDB();

        subscription = highlightRepository
            .watchFiltered(HighlighSearchFilter.byBookTitle(
                bookTitle: BookTitleFilter('title')))
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
      '\nWhen watchAll() is called'
      '\nThen throw NotAuthenticatedError',
      () async {
        when(mockIAuthFacade.getSignedInUser()).thenReturn(none());

        subscription = highlightRepository
            .watchFiltered(HighlighSearchFilter.byBookTitle(
                bookTitle: BookTitleFilter('title')))
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

    test(
      '\nGiven multiple highlights in DB'
      '\nWhen stream is listened with valid filter'
      '\nThen emitt a Stream with Right with a KtList holding the correct Highlight',
      () async {
        when(mockIAuthFacade.getSignedInUser()).thenReturn(
          some(
            User(id: UniqueId.fromUniqueString(mockUid)),
          ),
        );

        mockFirestore
            .collection(usersPath)
            .doc(mockUid)
            .collection(highlightsPath)
            .add(
          {
            'id': 'new-id',
            'color': 4294892630,
            'imageUrl': 'https://test-url.test',
            'quote': 'Test quote 2',
            'bookTitle': 'new book',
            'pageNumber': 666,
            'serverTimestamp': 1613512300,
          },
        );

        subscription = highlightRepository
            .watchFiltered(HighlighSearchFilter.byBookTitle(
                bookTitle: BookTitleFilter('Test title')))
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
                    equals(1),
                    reason: 'highlights.size is not 1',
                  );
                  highlights.map((highlight) {
                    expect(highlight, equals(mockHighlight));
                  });
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
      '\nGiven multiple highlights in DB'
      '\nWhen stream is listened with invalid filter'
      '\nThen emitt a Stream with Right with an empty KtList',
      () async {
        when(mockIAuthFacade.getSignedInUser()).thenReturn(
          some(
            User(id: UniqueId.fromUniqueString(mockUid)),
          ),
        );

        mockFirestore
            .collection(usersPath)
            .doc(mockUid)
            .collection(highlightsPath)
            .add(
          {
            'id': 'new-id',
            'color': 4294892630,
            'imageUrl': 'https://test-url.test',
            'quote': 'Test quote 2',
            'bookTitle': 'new book',
            'pageNumber': 666,
            'serverTimestamp': 1613512300,
          },
        );

        subscription = highlightRepository
            .watchFiltered(HighlighSearchFilter.byBookTitle(
                bookTitle: BookTitleFilter('inexistent title')))
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
                    reason: 'highlights.size is not 0',
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
          some(
            User(id: UniqueId.fromUniqueString(mockUid)),
          ),
        );

        mockFirestore
            .collection(usersPath)
            .doc(mockUid)
            .collection(highlightsPath)
            .add({'invalidField': 'invalidValue', 'bookTitle': 'title'});

        subscription = highlightRepository
            .watchFiltered(HighlighSearchFilter.byBookTitle(
                bookTitle: BookTitleFilter('title')))
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
                  expect(failure, equals(const HighlightFailure.unexpected()));
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
      imageUrl: ImageUrl('https://new-test-url.test'),
      bookTitle: BookTitle('Brand new book title'),
      pageNumber: QuotePage(999),
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
          some(
            User(id: UniqueId.fromUniqueString(mockUid)),
          ),
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
                    "color": 4294892630,
                    "imageUrl": "https://test-url.test",
                    "quote": "Test quote",
                    "bookTitle": "Test title",
                    "pageNumber": 666
                  },
                  "new-uid": {
                    "quote": "New inspirational quote",
                    "color": 4294747063,
                    "imageUrl": "https://new-test-url.test",
                    "bookTitle": "Brand new book title",
                    "pageNumber": 999
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
          some(
            User(id: UniqueId.fromUniqueString(mockUid)),
          ),
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

        verify(mockIAuthFacade.getSignedInUser()).called(1);
      },
    );
  });

  group('update', () {
    final updatedHighlight = mockHighlight.copyWith(
      color: HighlightColor(HighlightColor.predefinedColors[3]),
      quote: HighlightQuote('Test quote updated'),
      imageUrl: ImageUrl('https://test-url-updated.test'),
      bookTitle: BookTitle('Test title updated'),
      pageNumber: QuotePage(777),
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
          some(
            User(id: UniqueId.fromUniqueString(mockUid)),
          ),
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
                    "imageUrl": "https://test-url-updated.test",
                    "quote": "Test quote updated",
                    "bookTitle": "Test title updated",
                    "pageNumber": 777
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
          some(
            User(id: UniqueId.fromUniqueString(mockUid)),
          ),
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
                    "color": 4294892630,
                    "imageUrl": "https://test-url.test",
                    "quote": "Test quote",
                    "bookTitle": "Test title",
                    "pageNumber": 666
                  },
                  "non-existent-id": {
                    "quote": "Test quote updated",
                    "color": 4291883200,
                    "imageUrl": "https://test-url-updated.test",
                    "bookTitle": "Test title updated",
                    "pageNumber": 777
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
          some(
            User(id: UniqueId.fromUniqueString(mockUid)),
          ),
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
          some(
            User(id: UniqueId.fromUniqueString(mockUid)),
          ),
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
                    "color": 4294892630,
                    "imageUrl": "https://test-url.test",
                    "quote": "Test quote",
                    "bookTitle": "Test title",
                    "pageNumber": 666
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
  });
}