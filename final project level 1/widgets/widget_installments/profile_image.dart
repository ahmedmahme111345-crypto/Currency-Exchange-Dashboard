import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: ClipOval(
            child: Image.asset(
              'assets/images/logo (2).png',
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
