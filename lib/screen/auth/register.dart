import 'dart:convert';

import 'package:flutter/material.dart';
import '../../api/http_helper.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  String? _nameResponseError;
  String? _emailResponseError;
  String? _passwordResponseError;
  int? _statusCode;
  final TextEditingController txtName = TextEditingController(text: 'test');
  final TextEditingController txtEmail =
      TextEditingController(text: 'test@mail.com');
  final TextEditingController txtPassword =
      TextEditingController(text: 'password');
  final TextEditingController txtPasswordConfirmation =
      TextEditingController(text: 'password');

  String? validateName(String value) {
    if (!value.isNotEmpty) {
      return "Nama Masih Kosong";
    } else if (_statusCode != 200) {
      return _nameResponseError;
    }
    return null;
  }

  String? validateEmail(String value) {
    if (!value.isNotEmpty) {
      return "Email Masih Kosong";
    } else if (!value.contains('@')) {
      return "Kurang @";
    } else if (_statusCode != 200) {
      return _emailResponseError;
    }
    return null;
  }

  String? validatePassword(String value) {
    if (!value.isNotEmpty) {
      return "Password Masih Kosong";
    } else if (_statusCode != 200) {
      return _passwordResponseError;
    }
    return null;
  }

  String? validatePasswordConfirmation(String value) {
    if (!value.isNotEmpty) {
      return "Password Masih Kosong";
    } else if (_statusCode != 200) {
      return _passwordResponseError;
    }
    return null;
  }

  doRegister() async {
    final name = txtName.text;
    final email = txtEmail.text;
    final password = txtPassword.text;
    final passwordConfirmation = txtPasswordConfirmation.text;
    const deviceId = "12345";
    final response = await HttpHelper()
        .register(name, email, password, passwordConfirmation, deviceId);
    print(response.body);
    _statusCode = response.statusCode;
    if (response.statusCode == 200) {
      Navigator.pushNamed(context, '/');
    } else if (response.statusCode == 422) {
      var object = json.decode(response.body);
      var errors = object['errors'];
      setState(() {
        if (errors.length > 1) {
          _nameResponseError = errors['name'][0];
          _emailResponseError = errors['email'][0];
          _passwordResponseError = errors['password'][0];
        } else {
          if (errors.containsKey('name')) {
            _nameResponseError = errors['name'][0];
          } else if (errors.containsKey('email')) {
            _emailResponseError = errors['email'][0];
          } else {
            _passwordResponseError = errors['password'][0];
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: const Color(0xFFF3F6F9),
          padding: const EdgeInsets.all(30),
          margin: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Register',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 24,
                    color: Color(0xFF6777EE)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: txtName,
                decoration: InputDecoration(
                  errorText: validateName(txtName.text),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Name',
                  labelStyle: const TextStyle(
                      color: Color(0xFF6777EE),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito'),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 3, color: Color(0xFF6777EE)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 3, color: Color(0xFF6777EE)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: txtEmail,
                decoration: InputDecoration(
                  errorText: validateEmail(txtEmail.text),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Email',
                  labelStyle: const TextStyle(
                      color: Color(0xFF6777EE),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito'),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 3, color: Color(0xFF6777EE)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 3, color: Color(0xFF6777EE)),
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
                  errorText: validatePassword(txtPassword.text),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                      color: Color(0xFF6777EE),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito'),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 3, color: Color(0xFF6777EE)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 3, color: Color(0xFF6777EE)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: txtPasswordConfirmation,
                decoration: InputDecoration(
                  errorText: validatePasswordConfirmation(
                      txtPasswordConfirmation.text),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                      color: Color(0xFF6777EE),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito'),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 3, color: Color(0xFF6777EE)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 3, color: Color(0xFF6777EE)),
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
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: () {
                      doRegister();
                    },
                    child: const Text("Register",
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold))),
              ),
            ],
          ),
        ));
  }
}
