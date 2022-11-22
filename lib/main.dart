import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: GradeCalculator(),
    );
  }
}

class GradeCalculator extends StatefulWidget {
  @override
  State<GradeCalculator> createState() => _GradeCalculatorState();
}

class _GradeCalculatorState extends State<GradeCalculator> {
  final myGradeController = TextEditingController();
  String result = '';
  @override
  Widget build(BuildContext context) {
    String gradeStatus(int grade) {
      if (grade <= 90) {
        return 'A';
      } else if (grade <= 80) {
        return 'B';
      } else if (grade <= 70) {
        return 'C';
      } else {
        return 'D';
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text("Grade Calculator")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: myGradeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "write your grade",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  prefixIcon: Icon(
                    Icons.percent,
                  )),
            ),
          ),
          ElevatedButton.icon(
            icon: Icon(Icons.sentiment_dissatisfied_outlined),
            label: Text(
              'Calculate',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              var grade = int.tryParse(myGradeController.text);
              result = gradeStatus(grade!);
              setState(() {});
            },
          )
        ],
      ),
    );
  }
}
