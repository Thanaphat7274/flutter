import 'package:flutter/material.dart';

class FormCalculator extends StatefulWidget {
  const FormCalculator({super.key});

  @override
  State<FormCalculator> createState() => _FormCalculatorState();
}

class _FormCalculatorState extends State<FormCalculator> {
  @override
  String result = "";
  double sum = 0.0;
  final TextEditingController _test_totol = TextEditingController();
  final TextEditingController _exam_totol = TextEditingController();
  String getAqiColor(double test, double exam) {
    var total = test + exam;
    if (total >= 80) {
      return "A";
    } else if (total >= 70) {
      return "B";
    } else if (total >= 60) {
      return "C";
    } else if (total >= 50) {
      return "D";
    } else {
      return "F";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grade Calculator"),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              controller: _test_totol,
              decoration: const InputDecoration(labelText: 'คะเเนนเก็บ (40)'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "No data";
                }
                return null;
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _exam_totol,
              decoration: const InputDecoration(labelText: 'คะเเนนสอบ (60)'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "No data";
                }
                return null;
              },
            ),

            Text("Grade :${result}"),
            TextButton(
              onPressed: () {
                setState(() {
                  double score = double.tryParse(_test_totol.text) ?? 0;
                  double exam = double.tryParse(_exam_totol.text) ?? 0;

                  result = getAqiColor(score, exam);
                });
              },
              child: const Text('คำนวน'),
            ),
          ],
        ),
      ),
    );
  }
}
