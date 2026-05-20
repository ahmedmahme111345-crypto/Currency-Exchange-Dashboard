import 'package:flutter/material.dart';

class CountryDropdown extends StatelessWidget {
  final List<String> countries;
  final String selectedCountry;
  final ValueChanged<String?> onChanged;

  const CountryDropdown({
    required this.countries,
    required this.selectedCountry,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      value: selectedCountry == 'اختر بلدك' ? null : selectedCountry,
      icon: const SizedBox.shrink(), 
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.arrow_drop_down), 
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        border: OutlineInputBorder(),
      ),
      hint: Padding(
        padding: const EdgeInsets.only(right: 4.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'اختر بلدك',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      items: countries.where((country) => country != 'اختر بلدك').map((
        String country,
      ) {
        return DropdownMenuItem<String>(
          value: country,
          child: Align(alignment: Alignment.centerRight, child: Text(country)),
        );
      }).toList(),
      selectedItemBuilder: (BuildContext context) {
        return countries.where((country) => country != 'اختر بلدك').map((
          String country,
        ) {
          return Align(
            alignment: Alignment.centerRight,
            child: Text(country, overflow: TextOverflow.ellipsis),
          );
        }).toList();
      },
      onChanged: onChanged,
      validator: (value) {
        if (value == null) {
          return 'يرجى اختيار بلدك';
        }
        return null;
      },
    );
  }
}
