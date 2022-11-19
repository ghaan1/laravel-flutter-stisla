import '../api/http_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class AfterLogin extends StatefulWidget {

  @override
  State<AfterLogin> createState() => _AfterLoginState();
}

class _AfterLoginState extends State<AfterLogin> {

  

  String token = '';
  String name = '';
  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
   
      setState(() {
         const key = 'token';
         const key1 = 'name';
         final value = pref.get(key);
         final value1 = pref.get(key1);
         token = '$value';
         name = '$value1';
      });
    
  }
 
 @override
  void initState() {
    getPref();
    super.initState();
  }

  logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.remove("token");
      preferences.clear();
      
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text(
        "Berhasil logout",
        style: TextStyle(fontSize: 16),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       child: 
       Column(
        children : [ 
          
          Text(token),
          Text(name),
        Text('Masuk'),
        ElevatedButton(
          onPressed: (){
Navigator.pushNamed(context, "/");
logOut();
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

