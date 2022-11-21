import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

   @override
  State<LandingPage> createState() => _LandingPage();
}

class _LandingPage extends State<LandingPage> {
String token = '0';
  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
      setState(() {
         const key = 'token';
         final value = pref.get(key);
         token = '$value';
      });
  }
 
 @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
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
                    ),
                  ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    // Text(token),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFc2c9f8),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                      onPressed: (){
                        Navigator.pushNamed(context, "/login");
                      }, 
                      child: const Text('Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      )
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF343c77),
                        elevation: 10,
                        shape: RoundedRectangleBorder( //to set border radius to button
                          borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                      onPressed: (){
                        Navigator.pushNamed(context, "/register");
                      }, 
                      child: const Text('Register',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      )
                    ),
                  ],
                ),
            ),
          )
        ],
      )
    );
  }
}


