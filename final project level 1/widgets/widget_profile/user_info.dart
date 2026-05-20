import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final String name;
  final String email;
  final String country;

  const UserInfo({
    Key? key,
    required this.name,
    required this.email,
    required this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            color: Colors.black,
          ),
        ),
        Text(email, style: const TextStyle(fontSize: 14, color: Colors.black)),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xff6B7A54),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(country, style: const TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
