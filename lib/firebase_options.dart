import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Configuración predeterminada para usar Firebase en la aplicación.
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBZ9kfThOPtGPYGhgNvD8n9fdNdERJ0AmM',
    appId: '1:832653619760:web:5b955e3cc8ef62218133f5',
    messagingSenderId: '832653619760',
    projectId: 'manachynakusa',
    authDomain: 'manachynakusa.firebaseapp.com',
    storageBucket: 'manachynakusa.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD6plAIDdt112LxH7-nPYUjJfwByngedKw',
    appId: '1:832653619760:android:2a593d3eab616f4f8133f5',
    messagingSenderId: '832653619760',
    projectId: 'manachynakusa',
    storageBucket: 'manachynakusa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAtW5_sYtYNH4_wl4N9Q6inDmqCKjuADf4',
    appId: '1:832653619760:ios:8f3bd7fe8a96670a8133f5',
    messagingSenderId: '832653619760',
    projectId: 'manachynakusa',
    storageBucket: 'manachynakusa.appspot.com',
    iosClientId:
        '12345678901-abcdefghijklmnopqrstuvwxyz123456.apps.googleusercontent.com',
    iosBundleId: 'com.manachynakusa.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAtW5_sYtYNH4_wl4N9Q6inDmqCKjuADf4',
    appId: '1:832653619760:ios:8f3bd7fe8a96670a8133f5',
    messagingSenderId: '832653619760',
    projectId: 'manachynakusa',
    storageBucket: 'manachynakusa.appspot.com',
    iosClientId:
        '12345678901-abcdefghijklmnopqrstuvwxyz123456.apps.googleusercontent.com',
    iosBundleId: 'com.manachynakusa.app',
  );
}
