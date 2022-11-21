import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:stislaflutter/models/category_models.dart';
import '../../../api/http_helper.dart';
  

class MainKategori extends StatefulWidget {
  const MainKategori({super.key});
  @override
  State<MainKategori> createState() => _MainKategoriState();
}

class _MainKategoriState extends State<MainKategori> {
  List listCategory = [];
  String name ='';
 
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
        backgroundColor: const Color(0xFF6777EE),
        automaticallyImplyLeading: false,
      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF6777EE),
          onPressed: (){

          },
          child: const Icon(Icons.add,
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
                      Icon(
                        Icons.create_rounded, 
                        color: Colors.white
                      ),
                      Text('Edit', 
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        )
                      ),
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
                      Icon(
                        Icons.delete, 
                        color: Colors.white
                      ),
                      Text('Hapus',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        )
                      ),
                    ],
                  ),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF6777EE),
                    width: 1,
                  )
                ),
              child: ListTile(
                title:Text(kategori.name,
                  style: const TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
               ),
             ),
            );
          }
        ),
        ][currentPageIndex],
    );
  }
}
 int currentPageIndex = 0;


