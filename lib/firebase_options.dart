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
    apiKey: 'AIzaSyA3t9JK8Q_LQ6xq9T8KXIXQR66DmdwPTUU',
    appId: '1:63268418335:web:e59f3d27ef7e0b7259b62a',
    messagingSenderId: '63268418335',
    projectId: 'trai-ui',
    authDomain: 'trai-ui.firebaseapp.com',
    storageBucket: 'trai-ui.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJtYz-8IHC7-UerPjJaUPiLykaCVOvdEc',
    appId: '1:63268418335:android:2483a9a64a96501459b62a',
    messagingSenderId: '63268418335',
    projectId: 'trai-ui',
    storageBucket: 'trai-ui.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAyZA32xyp3vjGBTY2yvQhKbf3k9YAmTnU',
    appId: '1:63268418335:ios:bb439acf70f9f3a659b62a',
    messagingSenderId: '63268418335',
    projectId: 'trai-ui',
    storageBucket: 'trai-ui.appspot.com',
    iosBundleId: 'com.example.traiUi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAyZA32xyp3vjGBTY2yvQhKbf3k9YAmTnU',
    appId: '1:63268418335:ios:bb439acf70f9f3a659b62a',
    messagingSenderId: '63268418335',
    projectId: 'trai-ui',
    storageBucket: 'trai-ui.appspot.com',
    iosBundleId: 'com.example.traiUi',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA3t9JK8Q_LQ6xq9T8KXIXQR66DmdwPTUU',
    appId: '1:63268418335:web:797366837f83d46a59b62a',
    messagingSenderId: '63268418335',
    projectId: 'trai-ui',
    authDomain: 'trai-ui.firebaseapp.com',
    storageBucket: 'trai-ui.appspot.com',
  );
}
