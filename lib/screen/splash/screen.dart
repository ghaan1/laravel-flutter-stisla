import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stislaflutter/screen/landingPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) =>LandingPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(color: Color(0xFFF3F6F9)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50.0,
                      backgroundImage: AssetImage('assets/images/stisla-fill.jpg'),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    Text(
                      "~STISLA FLUTTER~",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 24.0,
                        fontFamily: 'Nunito',
                        color: Color(0xFF6777EE)),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
