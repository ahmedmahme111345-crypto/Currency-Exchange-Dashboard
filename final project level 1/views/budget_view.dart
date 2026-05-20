import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/widget_budget/budget_header.dart';
import 'package:flutter_application_1/widgets/widget_budget/expense_card.dart';

class BudgetScreen extends StatefulWidget {
  final double salary;
  const BudgetScreen({super.key, required this.salary});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  @override
  Widget build(BuildContext context) {
    double fixedExpensesPercent = 0.50;
    double personalVariablePercent = 0.30;
    double savingsPercent = 0.20;

    double fixedExpenses = widget.salary * fixedExpensesPercent;
    double personalVariable = widget.salary * personalVariablePercent;
    double savings = widget.salary * savingsPercent;

    return Scaffold(
      backgroundColor: const Color(0xFFFDF5E6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "ميزان",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              BudgetHeader(salary: widget.salary),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true, // يبدأ من  اليمين
                child: Row(
                  children: [
                    ExpenseCard(
                      title: "الادخارات والاستثمارات",
                      percent: savingsPercent,
                      amount: savings,
                      details: [
                        "زيادة المدخرات 💵",
                        "تعجيل تسديد الديون 📜",
                        "حالات الطوارئ 🚨",
                      ],
                    ),
                    const SizedBox(width: 12),
                    ExpenseCard(
                      title: "المصروفات الشخصية المتغيره",
                      percent: personalVariablePercent,
                      amount: personalVariable,
                      details: [
                        "التسوق 🛍️",
                        "الأنشطة الترفيهية 🎭",
                        "الرحلات ✈️",
                        "الهدايا 🎁",
                      ],
                    ),
                    const SizedBox(width: 12),
                    ExpenseCard(
                      title: "مصروفاتك الاساسيه الثابته",
                      percent: fixedExpensesPercent,
                      amount: fixedExpenses,
                      details: [
                        "فواتير الكهرباء والمياه 🔥",
                        "مصاريف التعليم 📚",
                        "الرعايه الصحيه 🏥",
                        "النقل 🚗",
                        "الاتصالات 📞",
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
