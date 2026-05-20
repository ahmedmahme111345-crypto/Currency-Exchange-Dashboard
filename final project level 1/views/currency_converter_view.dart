import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/widget_currency/amount_input.dart';
import 'package:flutter_application_1/widgets/widget_currency/convert_button.dart';
import 'package:flutter_application_1/widgets/widget_currency/currency_dropdown.dart';
import 'package:flutter_application_1/widgets/widget_currency/header_section.dart';
import 'package:flutter_application_1/widgets/widget_currency/instruction_box.dart';
import 'package:flutter_application_1/widgets/widget_currency/result_box.dart';

class CurrencyConverterScreen extends StatefulWidget {
  final String username;

  CurrencyConverterScreen({required this.username});

  @override
  _CurrencyConverterScreenState createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final amountController = TextEditingController();
  String selectedCurrency = 'Egypt (EGP)';
  double result = 0.0;

  final Map<String, double> exchangeRates = {
    'Egypt (EGP)': 48.44,
    'Saudi Arabia (SAR)': 3.75,
    'UAE (AED)': 3.67,
    'Bahrain (BHD)': 0.3770,
    'Kuwait (KWD)': 0.31,
    'Qatar (QAR)': 3.65,
    'Tunisia (TND)': 3.04,
    'Syria (SYP)': 14750,
    'Algeria (DZD)': 132.50,
    'Palestine (ILS)': 3.65,
    'Oman (OMR)': 0.39,
    'Sudan (SDG)': 601.50,
    'Lebanon (LBP)': 89500.00,
    'Libya (LYD)': 4.76,
    'Mauritania (MRU)': 39.73,
    'Iraq (IQD)': 1310.00,
    'Jordan (JOD)': 0.71,
    'Somalia (SOS)': 571,
    'Djibouti (DJF)': 177.94,
    'Comoros (KMF)': 443.55,
    'Morocco (MAD)': 9.72,
    'Germany (EUR)': 0.89,
    'Japan (JPY)': 143.28,
    'England (GBP)': 1.4847,
    'Switzerland (CHF)': 0.8435,
    'Australia (AUD)': 1.48,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f0df),
      appBar: AppBar(title: Text('ميزان')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            HeaderSection(),
            SizedBox(height: 20),
            InstructionBox(),
            SizedBox(height: 20),
            CurrencyDropdown(
              selectedCurrency: selectedCurrency,
              exchangeRates: exchangeRates,
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value!;
                });
              },
            ),
            SizedBox(height: 10),
            AmountInputField(controller: amountController),
            SizedBox(height: 20),
            ConvertButton(
              onPressed: () {
                double amount = double.tryParse(amountController.text) ?? 0;
                double rate = exchangeRates[selectedCurrency] ?? 1;
                setState(() {
                  result = amount / rate;
                });
              },
            ),
            SizedBox(height: 20),
            ResultBox(
              selectedCurrency: selectedCurrency,
              amountText: amountController.text,
              result: result,
            ),
          ],
        ),
      ),
    );
  }
}
