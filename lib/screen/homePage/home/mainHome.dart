import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stislaflutter/screen/homePage/home/widget/widget_banner.dart';
import 'package:stislaflutter/screen/homePage/home/widget/widget_title.dart';

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
      body: <Widget>[
        SingleChildScrollView(
          child: Column(
            children: [
               WidgetBanner(),
            WidgetTitle(),
           
            ],
          ),
        ),
      ][currentPageIndex],
    );
  }
}

