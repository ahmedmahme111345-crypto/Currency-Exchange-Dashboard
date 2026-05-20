import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  final VoidCallback onBack;

  const HeaderSection({required this.onBack, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: onBack,
            ),
            const SizedBox(width: 8),
            const Text(
              'الميزان',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
