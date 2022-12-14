import 'package:flutter/material.dart';
import 'package:stislaflutter/screen/homePage/home/mainHome.dart';
import 'package:stislaflutter/screen/homePage/profil/mainProfil.dart';

import 'kategori/mainKategori.dart';


class LandingHome extends StatefulWidget {
  const LandingHome({super.key});
  @override
  State<LandingHome> createState() => _LandingHomeState();
}

class _LandingHomeState extends State<LandingHome> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.list),
            label: 'Kategori',
          ),
          NavigationDestination(
            icon: Icon(Icons.accessibility),
            label: 'Profil',
          ),
        ],
      ),
      body: <Widget>[
        const MainHome(),
        const MainKategori(),
        const MainProfil(),
      ][currentPageIndex],
    );
   
  }
}

