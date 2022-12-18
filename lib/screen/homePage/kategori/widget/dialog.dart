import 'package:flutter/material.dart';
import 'package:stislaflutter/screen/homePage/kategori/CRUD/edit_kategori.dart';

import '../../../../models/category_models.dart';

class DialogKategori extends StatefulWidget {
  Category category;
  DialogKategori({
    Key? key,
    required this.category,
  }) : super(key: key);
  @override
  State<DialogKategori> createState() => _DialogKategoriState();
}

class _DialogKategoriState extends State<DialogKategori> {
  String text = '';

  @override
  void initState() {
    super.initState();
    text = widget.category!.name;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.4,
        height: MediaQuery.of(context).size.height / 7,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.1)),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Detail",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 15,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6777EE),
              ),
            )
          ],
        ),
      ),
    );
  }
}
