import 'package:flutter/material.dart';

class ConvertButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ConvertButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text('تحويل', style: TextStyle(fontSize: 18)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
        ),
      ),
    );
  }
}
