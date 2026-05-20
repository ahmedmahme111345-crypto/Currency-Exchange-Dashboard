import 'package:flutter/material.dart';
import 'screens/registration_screen.dart';

void main() => runApp(MizanApp());

class MizanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ميزان',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: RegistrationScreen(),
    );
  }
}
