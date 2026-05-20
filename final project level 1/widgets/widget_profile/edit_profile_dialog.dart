import 'package:flutter/material.dart';

class EditProfileDialog extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController salaryController;
  final TextEditingController bankBalanceController;
  final String selectedCountry;
  final List<String> arabCountries;
  final ValueChanged<String> onCountryChanged;
  final VoidCallback onSave;

  const EditProfileDialog({
    Key? key,
    required this.nameController,
    required this.emailController,
    required this.salaryController,
    required this.bankBalanceController,
    required this.selectedCountry,
    required this.arabCountries,
    required this.onCountryChanged,
    required this.onSave,
  }) : super(key: key);

  @override
  State<EditProfileDialog> createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  late String selectedCountry;
  bool obscureSalary = true;
  bool obscureBankBalance = true;

  final _formKey = GlobalKey<FormState>();

  late String originalName;
  late String originalEmail;
  late String originalSalary;
  late String originalBankBalance;

  @override
  void initState() {
    super.initState();
    selectedCountry = widget.selectedCountry;

    originalName = widget.nameController.text;
    originalEmail = widget.emailController.text;
    originalSalary = widget.salaryController.text;
    originalBankBalance = widget.bankBalanceController.text;
  }

  void _onCancel() {
    widget.nameController.text = originalName;
    widget.emailController.text = originalEmail;
    widget.salaryController.text = originalSalary;
    widget.bankBalanceController.text = originalBankBalance;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFFFDF3E7),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'تعديل البيانات الشخصيه',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: widget.nameController,
                    decoration: const InputDecoration(labelText: 'الاسم'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'من فضلك أدخل الاسم';
                      } else if (value.length < 3) {
                        return 'الاسم يجب أن يكون أكثر من ٣ أحرف';
                      } else if (!RegExp(
                        r'^[\u0600-\u06FFa-zA-Z ]+$',
                      ).hasMatch(value)) {
                        return 'الاسم يجب أن يحتوي على حروف فقط';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: widget.emailController,
                    decoration: const InputDecoration(labelText: 'الإيميل'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'من فضلك أدخل الإيميل';
                      } else if (!RegExp(
                        r'^[\w\.-]+@gmail\.com$',
                      ).hasMatch(value)) {
                        return 'من فضلك ادخل الايميل';
                      }
                      return null;
                    },
                  ),

                  TextFormField(
                    controller: widget.salaryController,
                    decoration: InputDecoration(
                      labelText: 'الراتب الشهري',
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureSalary
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            obscureSalary = !obscureSalary;
                          });
                        },
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    obscureText: obscureSalary,
                    obscuringCharacter: '*',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'من فضلك أدخل الراتب';
                      } else if (!RegExp(r'^\d+(\.\d+)?$').hasMatch(value)) {
                        return 'الراتب يجب أن يكون رقماً';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: widget.bankBalanceController,
                    decoration: InputDecoration(
                      labelText: 'الرصيد البنكي',
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureBankBalance
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            obscureBankBalance = !obscureBankBalance;
                          });
                        },
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    obscureText: obscureBankBalance,
                    obscuringCharacter: '*',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'من فضلك أدخل الرصيد البنكي';
                      } else if (!RegExp(r'^\d+(\.\d+)?$').hasMatch(value)) {
                        return 'الرصيد يجب أن يكون رقماً';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'اختر الدوله'),
                    value: selectedCountry,
                    items: widget.arabCountries.map((country) {
                      return DropdownMenuItem(
                        value: country,
                        child: Text(country),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCountry = value!;
                      });
                      widget.onCountryChanged(value!);
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: _onCancel,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                        ),
                        child: const Text(
                          'الغاء',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            widget.onSave();
                            Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[400],
                        ),
                        child: const Text('حفظ'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
