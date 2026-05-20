import 'package:flutter/material.dart';

class AddInstallmentDialog extends StatefulWidget {
  final void Function(Map<String, String>) onAdd;

  const AddInstallmentDialog({required this.onAdd, super.key});

  @override
  State<AddInstallmentDialog> createState() => _AddInstallmentDialogState();
}

class _AddInstallmentDialogState extends State<AddInstallmentDialog> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    _dateController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  void _onAddPressed() {
    widget.onAdd({
      'amount': _amountController.text,
      'date': _dateController.text,
      'note': _noteController.text,
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('إضافة القسط الشهري'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'القسط الشهري',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(
                labelText: 'المعاد',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _noteController,
              decoration: const InputDecoration(
                labelText: 'ملاحظات',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: _onAddPressed, child: const Text('إضافة')),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('إلغاء'),
        ),
      ],
    );
  }
}
