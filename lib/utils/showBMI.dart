// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

class ShowBMI extends StatelessWidget {
  final double? bmi;
  final String? bmiStatus;

  const ShowBMI({super.key, required this.bmi, required this.bmiStatus});

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    var onPrimaryColor = Theme.of(context).colorScheme.onPrimary;
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(16.0)),
      child: Center(
        child: Text(
          bmi == null ? "BMI: Not calculated yet." : "BMI: ${bmi?.toStringAsFixed(1)}, $bmiStatus.",
          style: TextStyle(color: onPrimaryColor, fontSize: 20.0),
        ),
      ),
    );
  }
}
