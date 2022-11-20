import 'dart:convert';
import 'dart:ui';

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
          child: Text('KATEGORI',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
          ),
          ),
        ),
        
        
        backgroundColor: Color(0xFF6777EE),
        automaticallyImplyLeading: false,
        
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF6777EE),
        onPressed: (){
          
        },
        child: Icon(Icons.add,
        size: 40,
        color: Colors.black,
        ),
      ),
      body: <Widget>[
        ListView.builder(
          itemCount: listCategory.length,
          itemBuilder:  (context, index){
            var kategori = listCategory[index];
            return Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.yellow,
                child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: const <Widget>[
                          Icon(Icons.create_rounded, color: Colors.white),
                          Text('Edit', style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  secondaryBackground: Container(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const <Widget>[
                        Icon(Icons.delete, color: Colors.white),
                        Text('Hapus', style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
             child: Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFF6777EE),
                  width: 1,
                )
              ),
               child: ListTile(
                        title:Text(kategori.name,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                        )
               ),
             ),
            );
          }),
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


