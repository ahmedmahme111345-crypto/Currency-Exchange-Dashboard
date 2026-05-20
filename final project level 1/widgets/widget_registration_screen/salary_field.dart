import 'package:flutter/material.dart';

class SalaryField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback toggleVisibility;

  const SalaryField({
    required this.controller,
    required this.obscureText,
    required this.toggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        obscureText: obscureText,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          labelText: 'الراتب الشهري',
          suffixIcon: IconButton(
            icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
            onPressed: toggleVisibility,
          ),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'الرجاء ملأ الخانة';
          }
          if (double.tryParse(value) == null) {
            return 'الرجاء إدخال رقم صحيح';
          }
          return null;
        },
      ),
    );
  }
}
