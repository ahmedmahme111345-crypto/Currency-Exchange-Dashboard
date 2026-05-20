import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:flutter_application_1/widgets/widget_registration_screen/name_field.dart';
import 'package:flutter_application_1/widgets/widget_registration_screen/email_field.dart';
import 'package:flutter_application_1/widgets/widget_registration_screen/salary_field.dart';
import 'package:flutter_application_1/widgets/widget_registration_screen/bank_balance_field.dart';
import 'package:flutter_application_1/widgets/widget_registration_screen/country_dropdown.dart';
import 'package:flutter_application_1/widgets/widget_registration_screen/header_section.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final salaryController = TextEditingController();
  final bankBalanceController = TextEditingController();

  bool hideSalary = true;
  bool hideBankBalance = true;

  String selectedCountry = 'اختر بلدك';

  final List<String> arabCountries = [
    'اختر بلدك',
    'مصر',
    'السعودية',
    'الإمارات',
    'الكويت',
    'قطر',
    'البحرين',
    'عمان',
    'الأردن',
    'فلسطين',
    'سوريا',
    'لبنان',
    'العراق',
    'اليمن',
    'الجزائر',
    'المغرب',
    'تونس',
    'ليبيا',
    'السودان',
    'جيبوتي',
    'جزر القمر',
    'موريتانيا',
    'الصومال',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                HeaderSection(),
                const SizedBox(height: 20),
                NameField(controller: nameController),
                EmailField(controller: emailController),
                SalaryField(
                  controller: salaryController,
                  obscureText: hideSalary,
                  toggleVisibility: () {
                    setState(() {
                      hideSalary = !hideSalary;
                    });
                  },
                ),
                BankBalanceField(
                  controller: bankBalanceController,
                  obscureText: hideBankBalance,
                  toggleVisibility: () {
                    setState(() {
                      hideBankBalance = !hideBankBalance;
                    });
                  },
                ),
                const SizedBox(height: 10),
                CountryDropdown(
                  countries: arabCountries,
                  selectedCountry: selectedCountry,
                  onChanged: (value) {
                    setState(() {
                      selectedCountry = value!;
                    });
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HomeScreen(
                            username: nameController.text,
                            email: emailController.text,
                            salary: double.parse(salaryController.text),
                            bankBalance: double.parse(
                              bankBalanceController.text,
                            ),
                            country: selectedCountry,
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('تسجيل'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
