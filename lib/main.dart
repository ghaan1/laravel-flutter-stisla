import 'package:stislaflutter/screen/login.dart';
import 'package:stislaflutter/screen/AfterLogin.dart';
import 'package:stislaflutter/screen/register.dart';
import 'package:stislaflutter/screen/splash/screen.dart';

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
        "/":(context) => const SplashScreen(),
          "/login":(context) => Login(),
          "/after":(context) => AfterLogin(),
          "/register":(context) => Register(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Nunito',
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
    
    );
  }
}

