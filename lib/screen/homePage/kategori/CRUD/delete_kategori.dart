import 'package:flutter/material.dart';

import 'package:stislaflutter/api/crud_helper.dart';
import 'package:stislaflutter/models/category_models.dart';


// ignore: must_be_immutable
class DeleteCategori extends StatefulWidget {
    Category category;
  DeleteCategori({
    Key? key,
    required this.category,
  }) : super(key: key);


  @override
  State<DeleteCategori> createState() => _DeleteCategoriState();
}

class _DeleteCategoriState extends State<DeleteCategori> {
    final TextEditingController txtEditCategory = TextEditingController();

  @override
  void initState() {
    super.initState();
    txtEditCategory.text = widget.category!.name;
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      title: const Text('Delete Category'),
      content: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: txtEditCategory,
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
            doDeleteCategory();
            },
            child: const Text(
              'Delete',
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

   doDeleteCategory() async {
                      final response =
                          await CrudHelper().deleteCategori(widget.category!);
                      print(response.body);
                      Navigator.pushNamed(context, "/main");
                    }
}