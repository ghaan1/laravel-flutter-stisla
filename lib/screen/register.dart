import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/http_helper.dart';




class Register extends StatefulWidget {
   @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {

  final TextEditingController txtName = TextEditingController(text: 'test');
  final TextEditingController txtEmail = TextEditingController(text: 'test@mail.com');
  final TextEditingController txtPassword = TextEditingController(text: 'password');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(5),
        child: Column(
        
        children: [
          Container(
            child: TextFormField(
              controller: txtName,
              decoration: InputDecoration(
                hintText: 'Name'
              ),
            ),
          ),
          Container(
            child: TextFormField(
              controller: txtEmail,
              decoration: InputDecoration(
                hintText: 'Email'
              ),
            ),
          ),
          Container(
            child: TextFormField(
              controller: txtPassword,
              decoration: InputDecoration(
                hintText: 'Password'
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                doRegister();
              },
              child: Text("Register")),
          ),
        ],
       ), 
      )
    );
  }
  Future doRegister() async{
  final name = txtName.text;
  final email = txtEmail.text;
  final password = txtPassword.text;
  final deviceId = "12345";
  final response = await HttpHelper().register(name, email, password, deviceId);
  print(response.body);
  Navigator.pushNamed(context, "/");
}
}


