import 'package:flutter/material.dart';

class InstructionBox extends StatelessWidget {
  const InstructionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'في هذه الغرفه يمكنك تحويل العملات إلى قيمتها الدولاريه',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
