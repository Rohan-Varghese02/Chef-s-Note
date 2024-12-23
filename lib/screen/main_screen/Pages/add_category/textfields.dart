// ignore_for_file: must_be_immutable

import 'package:cook_book/const/colors.dart';
import 'package:flutter/material.dart';

class Textfields extends StatelessWidget {
  Textfields({super.key, required this.titleController, required this.formkey});
  TextEditingController titleController;
  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Provide Title';
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Color(primary),
                )),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(
                      primary,
                    ),
                  ),
                ),
                label: Text(
                  'Title',
                  style: TextStyle(
                    color: Color(primary),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
