// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCacdcUDdMoiSlDopVdSheFiczT4RnRTow',
    appId: '1:258017621787:android:e986c5ce858c3aaa5a85be',
    messagingSenderId: '258017621787',
    projectId: 'routr-67395',
    storageBucket: 'routr-67395.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-OuEib4CZsKve2k2FMkq29WzZuVQwxfc',
    appId: '1:258017621787:ios:393b921eacc625eb5a85be',
    messagingSenderId: '258017621787',
    projectId: 'routr-67395',
    storageBucket: 'routr-67395.appspot.com',
    iosClientId:
        '258017621787-t1daro2fuhb7nof965j2uosavn7aojdu.apps.googleusercontent.com',
    iosBundleId: 'net.blasix.routr',
  );
}
