import 'package:stislaflutter/screen/landingPage.dart';
import 'package:stislaflutter/screen/login.dart';
import 'package:stislaflutter/screen/AfterLogin.dart';

import 'api/http_helper.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/":(context) => LandingPage(),
          "/login":(context) => Login(),
          "/after":(context) => AfterLogin(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    
    );
  }
}

