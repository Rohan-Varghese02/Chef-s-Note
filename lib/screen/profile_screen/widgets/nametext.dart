// ignore_for_file: must_be_immutable

import 'package:cook_book/const/colors.dart';
import 'package:flutter/material.dart';

class Nametext extends StatelessWidget {
  TextEditingController nameController;
  final GlobalKey<FormState> formkey;
  Nametext({super.key, required this.formkey, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Provide Name';
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
                  'Full Name',
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
