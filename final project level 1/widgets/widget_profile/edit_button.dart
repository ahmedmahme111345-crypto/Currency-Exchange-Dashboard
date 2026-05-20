import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  final VoidCallback onPressed;
  const EditButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[200],
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      ),
      child: const Text('تعديل', style: TextStyle(color: Colors.black)),
    );
  }
}
