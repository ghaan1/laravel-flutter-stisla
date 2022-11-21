import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stislaflutter/screen/homePage/LandingHome.dart';
import '../../api/http_helper.dart';

class Login extends StatefulWidget {
  const Login({super.key});
   @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {

  //final txtEmail = TextEditingController();
  //final txtPassword = TextEditingController();
  final txtEmail = TextEditingController(text : 'superadmin@gmail.com');
  final txtPassword = TextEditingController(text : 'password');

  Future doLogin() async{
    final email = txtEmail.text;
    final password = txtPassword.text;
    const deviceId = "12345";
    final response = await HttpHelper().login(email, password, deviceId);
    print(response.body);

    SharedPreferences pref = await SharedPreferences.getInstance();
      const key = 'token';
      final value = pref.get(key);
      final token = value;
      if (token == null) {
      Navigator.push(
          context,
        MaterialPageRoute(builder: (context) => Login()),
      );
      }else{
      Navigator.push(
          context,
        MaterialPageRoute(builder: (context) => LandingHome()),
      );
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: 
      Container(
        color: const Color(0xFFF3F6F9),
        padding: const EdgeInsets.all(30),
        //margin: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:   [ 
            const Text(
              'Login',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                  color: Color(0xFF6777EE)
                ),
              ),
          const SizedBox(
            height: 10,
          ),
            TextFormField(
              controller: txtEmail,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 17),
                filled: true,
                fillColor: Colors.white,
                labelText: 'Email',
                labelStyle: const TextStyle(
                  color: Color(0xFF6777EE),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito'
                ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 3, 
                      color: Color(0xFF6777EE)
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 3, 
                      color: Color(0xFF6777EE)),
                    borderRadius: BorderRadius.circular(15),
                ),
              ),
          ),     
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: txtPassword,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 17),
                filled: true,
                fillColor: Colors.white,
                labelText: 'Password',
                labelStyle: const TextStyle(
                  color: Color(0xFF6777EE),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito'
                ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 3, 
                      color: Color(0xFF6777EE)
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 3, 
                      color: Color(0xFF6777EE)),
                    borderRadius: BorderRadius.circular(15),
                ),
              ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 45,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6777EE),
                elevation: 10,
                shape: RoundedRectangleBorder( //to set border radius to button
                borderRadius: BorderRadius.circular(15)
            ),
              ),
              
              onPressed: () {
                doLogin();
              },
              child: const Text("Login",
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold
                ))),
          ),
          ],
        ),
      )
    );
  }
}


