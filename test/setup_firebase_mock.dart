import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:firebase_storage_platform_interface/firebase_storage_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

final MockFirebaseStorage kMockStoragePlatform = MockFirebaseStorage();

const String kBucket = 'gs://fake-storage-bucket-url.com';
const String testBucket = 'test-bucket';
const String testFullPath = 'foo/bar';

void setupFirebaseMock() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFirebase.channel.setMockMethodCallHandler((call) async {
    if (call.method == 'Firebase#initializeCore') {
      return [
        {
          'name': defaultFirebaseAppName,
          'options': {
            'apiKey': '123',
            'appId': '123',
            'messagingSenderId': '123',
            'projectId': '123',
            'storageBucket': kBucket,
          },
          'pluginConstants': {},
        }
      ];
    }

    if (call.method == 'Firebase#initializeApp') {
      return {
        // ignore: avoid_dynamic_calls
        'name': call.arguments['appName'],
        // ignore: avoid_dynamic_calls
        'options': call.arguments['options'],
        'pluginConstants': {},
      };
    }

    return null;
  });

  when(kMockStoragePlatform.delegateFor(
    app: anyNamed('app'),
    bucket: anyNamed('bucket'),
  )).thenReturn(kMockStoragePlatform);
}

class MockFirebaseStorage extends Mock
    with MockPlatformInterfaceMixin
    implements TestFirebaseStoragePlatform {
  MockFirebaseStorage() {
    TestFirebaseStoragePlatform();
  }

  @override
  final int maxOperationRetryTime = 0;
  @override
  final int maxDownloadRetryTime = 0;
  @override
  final int maxUploadRetryTime = 0;

  @override
  FirebaseStoragePlatform delegateFor({FirebaseApp app, String bucket}) {
    return super.noSuchMethod(
      Invocation.method(#delegateFor, [], {#app: app, #bucket: bucket}),
      TestFirebaseStoragePlatform(),
    ) as TestFirebaseStoragePlatform;
  }

  @override
  ReferencePlatform ref(String path) {
    return super.noSuchMethod(
      Invocation.method(#ref, [path]),
      TestReferencePlatform(),
    ) as TestReferencePlatform;
  }
}

class TestFirebaseStoragePlatform extends FirebaseStoragePlatform {
  TestFirebaseStoragePlatform() : super(bucket: testBucket);
  @override
  FirebaseStoragePlatform delegateFor({FirebaseApp app, String bucket}) {
    return this;
  }
}

class TestReferencePlatform extends ReferencePlatform {
  TestReferencePlatform() : super(TestFirebaseStoragePlatform(), testFullPath);
}
