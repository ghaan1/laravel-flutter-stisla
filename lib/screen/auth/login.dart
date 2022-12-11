import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stislaflutter/screen/homePage/LandingHome.dart';
import '../../api/http_helper.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  //final txtEmail = TextEditingController();
  //final txtPassword = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final txtEmail = TextEditingController(text: 'superadmin@gmail.com');
  final txtPassword = TextEditingController(text: 'password');
  var Token = '';
  bool _autoValidate = false;

  final Pattern _emailPattern =
      r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$";

  Future doLogin() async {
    final email = txtEmail.text;
    final password = txtPassword.text;
    const deviceId = "12345";
    final response = await HttpHelper().login(email, password, deviceId);
    print(response.body);

    SharedPreferences pref = await SharedPreferences.getInstance();
    const key = 'token';
    final value = pref.get(key);
    final token = value;
    Token = '$value';
    if (token == null) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => Login(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
    ),
      );
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          actions: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Color(0xff4338CA), Color(0xff6D28D9)]),
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(12, 26),
                        blurRadius: 50,
                        spreadRadius: 0,
                        color: Colors.grey.withOpacity(.1)),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(.05),
                    radius: 25,
                    child: Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/FlutterBricksLogo-Med.png?alt=media&token=7d03fedc-75b8-44d5-a4be-c1878de7ed52"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text("Email atau Password Salah",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LandingHome()),
      );
    }
    // print(Token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: const Color(0xFFF3F6F9),
          padding: const EdgeInsets.all(30),
          //margin: EdgeInsets.all(8),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                      color: Color(0xFF6777EE)),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: MultiValidator([
                    RequiredValidator(errorText: ""),
                    PatternValidator(_emailPattern,
                        errorText:
                            "Password must have atleast one special character"),
                  ]),
                  controller: txtEmail,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 17),
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
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Required";
                    }
                    return MatchValidator(errorText: "Passwords don't match")
                        .validateMatch(val, txtPassword.text);
                  },
                  controller: txtPassword,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 17),
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
                        if (_formKey.currentState!.validate() && Token == '') {
                          doLogin();
                        } else if (_formKey.currentState!.validate() &&
                            Token != '') {
                          doLogin();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.white,
                              content: Text(
                                'Validation Successful',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          );
                        } else {}
                      },
                      child: const Text("Login",
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.bold))),
                ),
              ],
            ),
          ),
        ));
  }
}