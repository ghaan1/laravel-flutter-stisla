import 'api/http_helper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'STISLA'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final txtEmail = TextEditingController(text : 'superadmin@gmail.com');
  final txtPassword = TextEditingController(text : 'password');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        child: Column(
        
        children: [
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
  final deviceId = "12345";
  final response = await HttpHelper().login(email, password, deviceId);
  print(response.body);
}
}

