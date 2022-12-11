import 'package:flutter/material.dart';
import 'package:stislaflutter/api/crud_helper.dart';

class TambahKategori extends StatefulWidget {
  const TambahKategori({Key? key}) : super(key: key);

  @override
  State<TambahKategori> createState() => _TambahKategoriState();
}

class _TambahKategoriState extends State<TambahKategori> {
    final TextEditingController txtAddCategory = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      title: const Text('New Task'),
      content: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: txtAddCategory,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Task',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              primary: const Color(0xff2da9ef),
            ),
            onPressed: () {
            doAddCategory();
            },
            child: const Text(
              'Add',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
   doAddCategory() async{
    final name = txtAddCategory.text;
    final response = await CrudHelper().addCategory(name);
    print(response.body);
    Navigator.pushNamed(context, "/main" );
  }
}