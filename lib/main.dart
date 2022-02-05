//
// To Create app:
// flutter create --project-name NAME APP --org net.blasix APP FOLDER NAME
//

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:routr/screens/authentication/login.dart';
import 'package:routr/screens/home.dart';
import 'firebase_options.dart';

void main() async {
  //initialze firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Routr',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ).copyWith(secondary: Colors.blue)
          /* dark theme settings */
          ),
      themeMode: ThemeMode.dark,
      /* ThemeMode.system to follow system theme, 
         ThemeMode.light for light theme, 
         ThemeMode.dark for dark theme
      */
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }

  // Widget Test() {
  //   FirebaseAuth.instance.authStateChanges().listen((User? user) {
  //     if (user == null) {
  //       HomeScreen();
  //     } else {
  //       LoginScreen();
  //     }
  //     return;
  //   });
  // }
}
