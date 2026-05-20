import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/widget_profile/logout_button.dart';
import 'package:flutter_application_1/widgets/widget_profile/title_text.dart';
import 'package:flutter_application_1/widgets/widget_profile/profile_avatar.dart';
import 'package:flutter_application_1/widgets/widget_profile/user_info.dart';
import 'package:flutter_application_1/widgets/widget_profile/data_cards.dart';
import 'package:flutter_application_1/widgets/widget_profile/edit_button.dart';
import 'package:flutter_application_1/widgets/widget_profile/edit_profile_dialog.dart';

class ProfileView extends StatefulWidget {
  final String username;
  final String email;
  final double salary;
  final double bankBalance;
  final String country;

  const ProfileView({
    Key? key,
    required this.username,
    required this.email,
    required this.salary,
    required this.bankBalance,
    required this.country,
  }) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController salaryController;
  late TextEditingController bankBalanceController;
  late String selectedCountry;

  final List<String> arabCountries = [
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
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.username);
    emailController = TextEditingController(text: widget.email);
    salaryController = TextEditingController(
      text: widget.salary.toStringAsFixed(0),
    );
    bankBalanceController = TextEditingController(
      text: widget.bankBalance.toStringAsFixed(0),
    );
    selectedCountry = widget.country;
  }

  void showEditDialog() {
    showDialog(
      context: context,
      builder: (_) => EditProfileDialog(
        nameController: nameController,
        emailController: emailController,
        salaryController: salaryController,
        bankBalanceController: bankBalanceController,
        selectedCountry: selectedCountry,
        arabCountries: arabCountries,
        onCountryChanged: (value) => setState(() => selectedCountry = value),
        onSave: () {
          setState(() {});
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('تم حفظ البيانات بنجاح')),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF4E8),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              const LogoutButton(),
              const SizedBox(height: 8),
              const TitleText(),
              const SizedBox(height: 10),
              const ProfileAvatar(),
              const SizedBox(height: 10),
              UserInfo(
                name: nameController.text,
                email: emailController.text,
                country: selectedCountry,
              ),
              const SizedBox(height: 10),
              DataCards(
                salary: salaryController.text,
                bankBalance: bankBalanceController.text,
              ),
              const SizedBox(height: 20),
              EditButton(onPressed: showEditDialog),
            ],
          ),
        ),
      ),
    );
  }
}
