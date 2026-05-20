import 'package:flutter/material.dart';

class DataCards extends StatelessWidget {
  final String salary;
  final String bankBalance;

  const DataCards({Key? key, required this.salary, required this.bankBalance})
    : super(key: key);

  Widget buildDataCircle(String title, String value) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: Colors.grey),
          ),
          child: Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 5),
        Text(title, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 48,
      padding: const EdgeInsets.symmetric(vertical: 70),
      decoration: BoxDecoration(
        color: const Color(0xffC8DAB0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildDataCircle('الراتب الشهري', salary),
          buildDataCircle('الحساب البنكي', bankBalance),
        ],
      ),
    );
  }
}
