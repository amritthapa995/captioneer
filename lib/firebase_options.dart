// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBjFdGQSDKM5PyUtPuXhk8vhsVQLwXg0zA',
    appId: '1:584393724891:web:2da589545ba6ccbef6cdfe',
    messagingSenderId: '584393724891',
    projectId: 'captioner-c6f78',
    authDomain: 'captioner-c6f78.firebaseapp.com',
    databaseURL: 'https://captioner-c6f78-default-rtdb.firebaseio.com',
    storageBucket: 'captioner-c6f78.appspot.com',
    measurementId: 'G-EH5VYCS9Z3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHkvjPtFFWrA61VWvfNITkIcUOPjmymyg',
    appId: '1:584393724891:android:cd3b4711872f8417f6cdfe',
    messagingSenderId: '584393724891',
    projectId: 'captioner-c6f78',
    databaseURL: 'https://captioner-c6f78-default-rtdb.firebaseio.com',
    storageBucket: 'captioner-c6f78.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB8yeXyVy2xli7XED7JHfh5yHnacHXPIjQ',
    appId: '1:584393724891:ios:dba8a8500b8bf400f6cdfe',
    messagingSenderId: '584393724891',
    projectId: 'captioner-c6f78',
    databaseURL: 'https://captioner-c6f78-default-rtdb.firebaseio.com',
    storageBucket: 'captioner-c6f78.appspot.com',
    iosBundleId: 'com.example.captioneer',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB8yeXyVy2xli7XED7JHfh5yHnacHXPIjQ',
    appId: '1:584393724891:ios:dba8a8500b8bf400f6cdfe',
    messagingSenderId: '584393724891',
    projectId: 'captioner-c6f78',
    databaseURL: 'https://captioner-c6f78-default-rtdb.firebaseio.com',
    storageBucket: 'captioner-c6f78.appspot.com',
    iosBundleId: 'com.example.captioneer',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBjFdGQSDKM5PyUtPuXhk8vhsVQLwXg0zA',
    appId: '1:584393724891:web:6f0bf2654fb116cbf6cdfe',
    messagingSenderId: '584393724891',
    projectId: 'captioner-c6f78',
    authDomain: 'captioner-c6f78.firebaseapp.com',
    databaseURL: 'https://captioner-c6f78-default-rtdb.firebaseio.com',
    storageBucket: 'captioner-c6f78.appspot.com',
    measurementId: 'G-FSMD6F4KXG',
  );
}
