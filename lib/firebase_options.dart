// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
// ignore: depend_on_referenced_packages
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
    apiKey: 'AIzaSyC754kj3eivaafcx0ZzbKE4Arjno3ueC5g',
    appId: '1:207668910724:android:4bfbfa6d5801a90b3a40d1',
    messagingSenderId: '207668910724',
    projectId: 'demoproject-a5d7f',
    storageBucket: 'demoproject-a5d7f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD9WTiuLnVVdB9WVCkipWfi6RR5KoJrezE',
    appId: '1:207668910724:ios:69323b991380a2003a40d1',
    messagingSenderId: '207668910724',
    projectId: 'demoproject-a5d7f',
    storageBucket: 'demoproject-a5d7f.appspot.com',
    androidClientId:
        '207668910724-rfkmvibtoo882n12oc1g2oaarbjc9jvr.apps.googleusercontent.com',
    iosClientId:
        '207668910724-51rvvbk04sbirkrrhui549j4ba6viiis.apps.googleusercontent.com',
    iosBundleId: 'com.example.week5Assignment',
  );
}
