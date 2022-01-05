//
// To Create app:
// flutter create --project-name NAME APP --org net.blasix APP FOLDER NAME
//

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
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
