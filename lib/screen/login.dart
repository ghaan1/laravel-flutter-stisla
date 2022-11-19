import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/http_helper.dart';




class Login extends StatefulWidget {
  const Login({super.key});

   @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {

  final txtEmail = TextEditingController(text : 'superadmin@gmail.com');
  final txtPassword = TextEditingController(text : 'password');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(5),
        child: Column(
        children: [
          TextFormField(
            controller: txtEmail,
            decoration: const InputDecoration(
              hintText: 'Email'
            ),
          ),
          TextFormField(
            controller: txtPassword,
            decoration: const InputDecoration(
              hintText: 'Password'
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                doLogin();
              },
              child: Text("Login")),
          ),
        ],
       ), 
      )
    );
  }
  Future doLogin() async{
  final email = txtEmail.text;
  final password = txtPassword.text;
  const deviceId = "12345";
  final response = await HttpHelper().login(email, password, deviceId);
  print(response.body);

  Navigator.pushNamed(context, "/after");
}

read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    }
  }


