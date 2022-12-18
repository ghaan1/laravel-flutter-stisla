import 'package:flutter/material.dart';

import 'package:stislaflutter/api/crud_helper.dart';
import 'package:stislaflutter/models/category_models.dart';

// ignore: must_be_immutable
class EditKategori extends StatefulWidget {
  Category category;
  EditKategori({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<EditKategori> createState() => _EditKategoriState();
}

class _EditKategoriState extends State<EditKategori> {
  final TextEditingController txtEditCategory = TextEditingController();

  @override
  void initState() {
    super.initState();
    txtEditCategory.text = widget.category!.name;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.4,
        height: MediaQuery.of(context).size.height / 4.667,
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
            const SizedBox(
              height: 10,
            ),
            const Text("Edit",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 250,
              child: TextFormField(
                controller: txtEditCategory,
                decoration: InputDecoration(
                  // errorText: validateEmail(txtEmail.text),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Kategori',
                  labelStyle: const TextStyle(
                      color: Color(0xFF6777EE),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito'),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 3, color: Color(0xFF6777EE)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 3, color: Color(0xFF6777EE)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6777EE),
                    elevation: 10,
                  ),
                  onPressed: () {
                    doEditCategory();
                  },
                  child: const Text("Edit",
                      style: TextStyle(
                          fontFamily: 'Nunito', fontWeight: FontWeight.bold))),
            ),
          ],
        ),
      ),
    );
  }

  doEditCategory() async {
    final name = txtEditCategory.text;
    final response = await CrudHelper().editCategori(widget.category!, name);
    print(response.body);
     Navigator.of(context).pop(false);
  }
}
