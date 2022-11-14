
import 'package:flutter/material.dart';



class AfterLogin extends StatefulWidget {


  @override
  State<AfterLogin> createState() => _AfterLoginState();
}

class _AfterLoginState extends State<AfterLogin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       child: 
       Column(
        children : [ 
        Text('Masuk'),
        ElevatedButton(
          onPressed: (){
Navigator.pushNamed(context, "/");
          },
        child: Text('LOGOUT')),
        ],
        ),

      )
    );
  }
//   Future doLogin() async{
//   final email = txtEmail.text;
//   final password = txtPassword.text;
//   final deviceId = "12345";
//   final response = await HttpHelper().login(email, password, deviceId);
//   print(response.body);
//   Navigator.pushNamed(context, "/after");
// }

}

