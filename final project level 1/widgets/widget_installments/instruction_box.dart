import 'package:flutter/material.dart';

class InstructionBox extends StatelessWidget {
  const InstructionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFD9E8C6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text(
          'في هذه الغرفه يتم عرض او اضافة او حذف الاقساط الملتزم بها حالياً',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
