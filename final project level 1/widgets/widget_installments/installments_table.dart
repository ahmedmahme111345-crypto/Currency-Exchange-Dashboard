import 'package:flutter/material.dart';

class InstallmentsTable extends StatelessWidget {
  final List<Map<String, String>> installments;

  const InstallmentsTable({required this.installments, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: DataTable(
            border: TableBorder.all(color: Colors.green),
            columnSpacing: 0,
            headingRowHeight: 40,
            dataRowHeight: 40,
            columns: const [
              DataColumn(
                label: SizedBox(
                  width: 100,
                  child: Center(
                    child: Text(
                      'القسط الشهري',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              DataColumn(
                label: SizedBox(
                  width: 80,
                  child: Center(
                    child: Text(
                      'المعاد',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              DataColumn(
                label: SizedBox(
                  width: 100,
                  child: Center(
                    child: Text(
                      'ملاحظات',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
            rows: installments.map((item) {
              return DataRow(
                cells: [
                  DataCell(
                    SizedBox(
                      width: 100,
                      child: Center(
                        child: Text(
                          item['amount'] ?? '',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    SizedBox(
                      width: 80,
                      child: Center(
                        child: Text(
                          item['date'] ?? '',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    SizedBox(
                      width: 100,
                      child: Center(
                        child: Text(
                          item['note'] ?? '',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
