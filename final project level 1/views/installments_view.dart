import 'package:flutter/material.dart';

import 'package:flutter_application_1/widgets/widget_installments/add_installment_dialog.dart';
import 'package:flutter_application_1/widgets/widget_installments/empty_state.dart';
import 'package:flutter_application_1/widgets/widget_installments/header_section.dart';
import 'package:flutter_application_1/widgets/widget_installments/profile_image.dart';
import 'package:flutter_application_1/widgets/widget_installments/instruction_box.dart';
import 'package:flutter_application_1/widgets/widget_installments/installments_table.dart';

class InstallmentsScreen extends StatefulWidget {
  const InstallmentsScreen({super.key});

  @override
  State<InstallmentsScreen> createState() => _InstallmentsScreenState();
}

class _InstallmentsScreenState extends State<InstallmentsScreen> {
  final List<Map<String, String>> _installments = [];

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) => AddInstallmentDialog(
        onAdd: (newInstallment) {
          setState(() {
            _installments.add(newInstallment);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFAF0),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: HeaderSection(onBack: () => Navigator.of(context).pop()),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileImage(),
            const SizedBox(height: 10),
            const InstructionBox(),
            const SizedBox(height: 10),
            _installments.isEmpty
                ? const EmptyState()
                : InstallmentsTable(installments: _installments),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton(
              onPressed: _showAddDialog,
              backgroundColor: const Color(0xFF5E7556),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
