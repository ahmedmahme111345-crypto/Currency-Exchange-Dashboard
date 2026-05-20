import 'package:flutter/material.dart';

class AmountInputField extends StatelessWidget {
  final TextEditingController controller;

  const AmountInputField({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        labelText: 'أدخل المبلغ',
        border: OutlineInputBorder(),
      ),
    );
  }
}
