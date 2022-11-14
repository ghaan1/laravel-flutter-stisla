import 'package:flutter/material.dart';
import 'package:network/network.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/http_helper.dart';

class LandingPage extends StatefulWidget {
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
      body: Container(
        
        width: double.infinity,
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(token),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, "/login");
            }, child: Text('Login')),
             ElevatedButton(onPressed: (){
Navigator.pushNamed(context, "/register");
            }, child: Text('Register'))
          ],
          
        ),
      )
    );
  }
  Future read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    // if(value != '0'){
    //   Navigator.of(context).push(
    //       new MaterialPageRoute(
    //         builder: (BuildContext context) => new Dashboard(),
    //       )
    //   );
    return key;
    }
  }


