import 'package:flutter/material.dart';
import 'package:network/network.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stislaflutter/screen/homePage/home/mainHome.dart';

import '../../../api/http_helper.dart';


class MainProfil extends StatefulWidget {
  const MainProfil({super.key});

  @override
  State<MainProfil> createState() => _MainProfilState();
}

class _MainProfilState extends State<MainProfil> {
  int currentPageIndex = 0;

  String token = '';
  String name = '';
  String email = '';

  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
      setState(() {
         const key = 'token';
         const key1 = 'name';
         const key2 = 'email';
         final value = pref.get(key);
         final value1 = pref.get(key1);
         final value2 = pref.get(key2);
         token = '$value';
         name = '$value1';
         email = '$value2';
         txtName.text=name;
         txtToken.text=token;
         txtEmail.text=email;
      });
  }
   logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(()  {
      preferences.remove("token");
      preferences.clear();   
       
    });
     final response = await HttpHelper().logout(token);
      print(response.body);
  }

  final txtName = TextEditingController();
  final txtToken = TextEditingController();
  final txtEmail = TextEditingController();
  
 @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        title: const Center(
          child: Text('Profil',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
          ),
          ),
        ),
        backgroundColor: Color(0xFF6777EE),
        automaticallyImplyLeading: false,
      ),
      body: <Widget>[
        Container(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 50,
                      child: Icon(Icons.face_rounded,
                      size: 100,)
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFormField(
              controller: txtName,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 17),
                filled: true,
                fillColor: Colors.white,
                labelText: 'Name',
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
                   TextFormField(
              controller: txtToken,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 17),
                filled: true,
                fillColor: Colors.white,
                labelText: 'Token',
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
                 ElevatedButton(
          onPressed: (){
Navigator.pushNamed(context, "/");
logOut();
          },
        child: Text('LOGOUT')),

                  ],
                ),
              ),
            ],
          ),
        ),
      ][currentPageIndex],
    );
   
  }
}

