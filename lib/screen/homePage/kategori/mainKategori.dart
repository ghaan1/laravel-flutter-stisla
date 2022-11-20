import 'package:flutter/material.dart';
import 'package:stislaflutter/screen/homePage/home/mainHome.dart';

import '../profil/mainProfil.dart';


class MainKategori extends StatefulWidget {
  const MainKategori({super.key});

  @override
  State<MainKategori> createState() => _MainKategoriState();
}

class _MainKategoriState extends State<MainKategori> {
  int currentPageIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: const Center(
          child: Text('Kategori',
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
        child: Text('KATEGORI'),
       )
      ][currentPageIndex],
    );
   
  }
}

