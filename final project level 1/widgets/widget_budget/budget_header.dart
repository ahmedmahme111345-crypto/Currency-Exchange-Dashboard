import 'package:flutter/material.dart';

class BudgetHeader extends StatelessWidget {
  final double salary;
  const BudgetHeader({super.key, required this.salary});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFA3C49B),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            "في هذه الصفحة يتم عرض أفضل نسبه لتنظيم المصروفات من خلال مرتبك",
            style: TextStyle(fontSize: 16, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          decoration: BoxDecoration(
            color: const Color(0xFF7B9F78),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            salary.toStringAsFixed(0),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
