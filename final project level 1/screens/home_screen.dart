import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/currency_converter_view.dart';
import 'package:flutter_application_1/views/installments_view.dart';
import 'package:flutter_application_1/views/budget_view.dart';
import 'package:flutter_application_1/views/profile_view.dart';

class HomeScreen extends StatelessWidget {
  final String username;
  final String email;
  final double salary;
  final double bankBalance;
  final String country;

  HomeScreen({
    required this.username,
    required this.email,
    required this.salary,
    required this.bankBalance,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f0df),
      appBar: AppBar(title: Text('ميزان'), backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'أهلاً بك في الميزان يا ${username}',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(height: 20),
            buildMenuItem(
              context,
              title: 'حساب تحويل العملات إلى الدولار',
              imagePath: 'assets/images/dolar.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CurrencyConverterScreen(username: username),
                  ),
                );
              },
            ),
            buildMenuItem(
              context,
              title: 'عرض الأقساط ومواعيدها',
              imagePath: 'assets/images/aqsat.jpg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InstallmentsScreen(),
                  ),
                );
              },
            ),
            buildMenuItem(
              context,
              title: 'تنظيم المصروفات بالنسبة لدخلك الشهري',
              imagePath: 'assets/images/masrouf.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BudgetScreen(salary: salary),
                  ),
                );
              },
            ),
            buildMenuItem(
              context,
              title: 'البيانات الشخصية',
              imagePath: 'assets/images/data.jpg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfileView(
                      username: username,
                      email: email,
                      salary: salary,
                      bankBalance: bankBalance,
                      country: country,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(
    BuildContext context, {
    required String title,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return Card(
      color: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        height: 100,
        child: ListTile(
          contentPadding: EdgeInsets.only(right: 20, left: 16),
          leading: ClipOval(
            child: Image.asset(
              imagePath,
              height: 70, // تكبير الصورة
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          title: Align(
            alignment: Alignment.centerRight,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18, // تكبير الخط
              ),
              textAlign: TextAlign.right,
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
