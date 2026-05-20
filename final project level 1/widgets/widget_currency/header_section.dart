import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: ClipOval(
            child: Image.asset(
              'assets/images/logo (2).png',
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
