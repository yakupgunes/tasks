// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyApQM7Ea0x7va_HOGUEmcb6JWLEmBD6Gi0',
    appId: '1:873923033108:android:fb3fc7f784f0fd32734f01',
    messagingSenderId: '873923033108',
    projectId: 'kolaypara-befcd',
    storageBucket: 'kolaypara-befcd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDTfL3fh-ChnE615snj2ZXTSU_VSWNu8Nw',
    appId: '1:873923033108:ios:34bac55f06364cce734f01',
    messagingSenderId: '873923033108',
    projectId: 'kolaypara-befcd',
    storageBucket: 'kolaypara-befcd.appspot.com',
    androidClientId: '873923033108-44ge77f5mhnh9e383fr25hud5j54u5gc.apps.googleusercontent.com',
    iosClientId: '873923033108-73ddg95954c36ve4apjf116rk6v0u1jm.apps.googleusercontent.com',
    iosBundleId: 'com.example.kolaypara',
  );
}
