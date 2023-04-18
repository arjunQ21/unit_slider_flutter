import 'package:flutter/material.dart';

import 'unit_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:  UnitSliderExample(),
    );
  }
}

class UnitSliderExample extends StatefulWidget {
  @override
  _UnitSliderExampleState createState() => _UnitSliderExampleState();
}

class _UnitSliderExampleState extends State<UnitSliderExample> {
  double _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UnitSlider(
          minValue: 1,
          maxValue: 5,
          value: 3,
          steps: 30,
          onChanged: (value) {
            setState(() {
              _currentValue = value;
            });
          },
        ),
        SizedBox(height: 16),
        Text(
          'Current Value: ${_currentValue.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
