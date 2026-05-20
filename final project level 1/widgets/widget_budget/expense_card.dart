import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  final String title;
  final double percent;
  final double amount;
  final List<String> details;

  const ExpenseCard({
    super.key,
    required this.title,
    required this.percent,
    required this.amount,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: MediaQuery.of(context).size.height - 350,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFFDF5E6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: percent),
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeOut,
                  builder: (context, value, child) {
                    return CircularProgressIndicator(
                      value: value,
                      strokeWidth: 6,
                      backgroundColor: Colors.grey.shade200,
                      color: Colors.green,
                    );
                  },
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0, end: percent),
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeOut,
                    builder: (context, value, child) {
                      return Text(
                        "${(value * 100).toStringAsFixed(0)}%",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0, end: percent),
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeOut,
                    builder: (context, value, child) {
                      return Text(
                        "\$${(amount * (value / percent)).toStringAsFixed(0)}",

                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: details
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(item, style: const TextStyle(fontSize: 13)),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
