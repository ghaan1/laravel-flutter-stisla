import 'package:flutter/material.dart';
import '../api/http_helper.dart';

class LandingPage extends StatefulWidget {
   @override
  State<LandingPage> createState() => _LandingPage();
}

class _LandingPage extends State<LandingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        width: double.infinity,
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, "/login");
            }, child: Text('Login')),
             ElevatedButton(onPressed: (){

            }, child: Text('Register'))
          ],
          
        ),
      )
    );
  }
  
}

