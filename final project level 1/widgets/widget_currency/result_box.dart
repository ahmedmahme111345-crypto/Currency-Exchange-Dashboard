import 'package:flutter/material.dart';

class ResultBox extends StatelessWidget {
  final String selectedCurrency;
  final String amountText;
  final double result;

  const ResultBox({
    required this.selectedCurrency,
    required this.amountText,
    required this.result,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.green.shade300),
      ),
      child: Text(
        '$selectedCurrency (${amountText}) = ${result.toStringAsFixed(3)} USD',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
