import 'package:flutter/material.dart';

class CurrencyDropdown extends StatelessWidget {
  final String selectedCurrency;
  final Map<String, double> exchangeRates;
  final ValueChanged<String?> onChanged;

  const CurrencyDropdown({
    required this.selectedCurrency,
    required this.exchangeRates,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: DropdownButton<String>(
            value: selectedCurrency,
            isExpanded: true,
            items: exchangeRates.keys.map((String currency) {
              return DropdownMenuItem<String>(
                value: currency,
                child: Text(currency),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
        SizedBox(width: 10),
        Text(
          'اختر العمله المراد تحويلها',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
