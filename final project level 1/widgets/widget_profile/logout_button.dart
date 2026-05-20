import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/logout_view.dart'; 

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Align(
        alignment: Alignment.topLeft,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LogoutView()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff6B7A54),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          child: const Text(
            'تسجيل خروج',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
