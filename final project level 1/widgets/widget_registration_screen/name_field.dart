import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  final TextEditingController controller;

  const NameField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.right,
        decoration: const InputDecoration(labelText: 'الاسم'),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'الرجاء ملأ الخانة';
          }
          if (value.trim().length < 3) {
            return 'الاسم يجب أن يكون 3 أحرف على الأقل';
          }
          return null;
        },
      ),
    );
  }
}
