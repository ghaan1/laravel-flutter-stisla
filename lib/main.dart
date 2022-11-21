import 'package:stislaflutter/screen/homePage/LandingHome.dart';
import 'package:stislaflutter/screen/homePage/home/mainHome.dart';
import 'package:stislaflutter/screen/homePage/kategori/mainKategori.dart';
import 'package:stislaflutter/screen/homePage/profil/mainProfil.dart';
import 'package:stislaflutter/screen/auth/login.dart';
import 'package:stislaflutter/screen/auth/register.dart';
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
          "/login":(context) => const Login(),
          "/register":(context) => const Register(),
          "/main":(context) => const LandingHome(),
          "/mainhome":(context) => const MainHome(),
          "/mainprofil":(context) => const MainProfil(),
          "/mainkategori":(context) => const MainKategori(),

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

