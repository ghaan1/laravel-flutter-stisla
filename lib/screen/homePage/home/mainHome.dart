import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});
  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int currentPageIndex = 0;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('HOME',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
          ),
          ),
        ),
        backgroundColor: const Color(0xFF6777EE),
        automaticallyImplyLeading: false,
      ),
      body: <Widget>[
        Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF6777EE)
                ),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text('WELCOME',
                      style : TextStyle(
                        letterSpacing: 5,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito',
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: 
              Text(name,
                style : const TextStyle(
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ][currentPageIndex],
    );
  }
}

