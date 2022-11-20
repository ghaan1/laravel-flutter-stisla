import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:network/network.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stislaflutter/models/category_models.dart';
import 'package:stislaflutter/screen/homePage/home/mainHome.dart';
import 'package:http/http.dart';
import '../../../api/http_helper.dart';
import '../profil/mainProfil.dart';
  

class MainKategori extends StatefulWidget {
  const MainKategori({super.key});

  @override
  State<MainKategori> createState() => _MainKategoriState();
}

class _MainKategoriState extends State<MainKategori> {
//late Future<Category> futureCategory;
 List listCategory = [];
 
  
getKategori() async {
  final response = await HttpHelper().getKategori();
  var dataResponse = jsonDecode(response.body);
  setState(() {
  var listRespon = dataResponse['data'];
  for(var i=0; i< listRespon.length; i++){
     listCategory.add(Category.fromJson(listRespon[i]));
  }
  });
  }

 @override
  void initState() {
    super.initState();
    getKategori();

  }

String name ='';
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
        ListView.builder(
          itemCount: listCategory.length,
          itemBuilder:  (context, index){
            var kategori = listCategory[index];
            return Container(
              child: Text(kategori.name)
            );
          
          })
      //  FutureBuilder<Category>(
      //  future: futureCategory,
      //  builder: (context, snapshot) {
         
         // if (snapshot.hasData) {
          // return Text(snapshot.data!.name);
         // } else if (snapshot.hasError) {
         //   return Text('${snapshot.error}');
         // }
       //print(snapshot);
         // By default, show a loading spinner.
         //return const CircularProgressIndicator();
      //  },
      //  ),
       
        // ElevatedButton(
        //   onPressed: (){
        //   kategori();
        //   },
        // child: Text('ambil data')),

      ][currentPageIndex],
    );
   
  }
}
 int currentPageIndex = 0;

Future kategori() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   const key = 'token';
    final value = prefs.get(key);
    final token = '$value';
//print(token);
    final futureCategory = await HttpHelper().getKategori();
    //futureCategory = HttpHelper().getKategori();
print(futureCategory);
    //print(response.body);
  }


