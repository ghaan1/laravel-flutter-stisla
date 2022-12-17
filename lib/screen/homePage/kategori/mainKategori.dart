import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:stislaflutter/api/crud_helper.dart';
import 'package:stislaflutter/models/category_models.dart';
import 'package:stislaflutter/screen/homePage/kategori/CRUD/edit_kategori.dart';
import 'package:stislaflutter/screen/homePage/kategori/CRUD/delete_kategori.dart';
import 'package:stislaflutter/screen/homePage/kategori/CRUD/tambah_kategori.dart';
import 'package:stislaflutter/screen/homePage/kategori/widget/widget_banner_kategori.dart';

import '../home/widget/widget_banner.dart';

class MainKategori extends StatefulWidget {
  const MainKategori({
    super.key,
  });

  @override
  State<MainKategori> createState() => _MainKategoriState();
}

class _MainKategoriState extends State<MainKategori> {
  List listCategory = [];
  String name = '';
  List<String> user = [];
  List<Category> categories = [];
  int selectedIndex = 0;
  int currentPage = 1;
  int lastPage = 0;
  bool isLoading = true;
  final ScrollController scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  // getKategori() async {
  //   final response = await CrudHelper().getKategori();
  //   var dataResponse = jsonDecode(response.body);
  //   setState(() {
  //     var listRespon = dataResponse['data'];
  //     for(var i=0; i< listRespon.length; i++){
  //       listCategory.add(Category.fromJson(listRespon[i]));
  //     }
  //   });
  // }
  fetchData() {
    CrudHelper.getCategories(currentPage.toString()).then((resultList) {
      setState(() {
        categories = resultList[0];
        lastPage = resultList[1];
        isLoading = false;
      });
    });
  }

  addMoreData() {
    CrudHelper.getCategories(currentPage.toString()).then((resultList) {
      setState(() {
        categories.addAll(resultList[0]);
        lastPage = resultList[1];
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        if (currentPage < lastPage) {
          setState(() {
            isLoading = true;
            currentPage++;
            addMoreData();
          });
        }
      }
    });

    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF6777EE),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return const TambahKategori();
              });
        },
        child: const Icon(
          Icons.add,
          size: 40,
          color: Colors.black,
        ),
      ),
      body: <Widget>[
        Column(
          children: [
            Expanded(flex: 1, child: WidgetBannerKategori()),
            Expanded(
              flex: 2,
              child: ListView.builder(
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(10
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      background: Container(
                        color: Colors.yellow,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: const <Widget>[
                              Icon(Icons.create_rounded, color: Colors.white),
                              Text('Edit',
                                  style: TextStyle(
                                      color: Colors.black,
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
                              Text('Hapus',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                      onDismissed: (DismissDirection direction) {
                        if (direction == DismissDirection.startToEnd) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return EditKategori(
                                    category: categories[index]);
                              });
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return DeleteCategori(
                                    category: categories[index]);
                              });
                        }
                      },
                      child: Container(
                        height: 150,
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: const Color(0xFF6777EE),
                          width: 1,
                        )),
                        child: ListTile(
                          title: Text(
                            categories[index].name,
                            style: const TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ][currentPageIndex],
    );
  }
}

int currentPageIndex = 0;
