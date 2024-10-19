// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:math';

import 'package:bmi_calculator/utils/gender_picker.dart';
import 'package:bmi_calculator/utils/height_picker.dart';
import 'package:bmi_calculator/utils/showBMI.dart';
import 'package:bmi_calculator/utils/weight_age_picker.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  int? _height;
  int? _weight;
  int? _age;
  double? _bmi;
  String? _bmiStatus;
  int _selectedGender = 0;

  @override
  Widget build(BuildContext context) {
    var onPrimaryColor = Theme.of(context).colorScheme.onPrimary;
    return Scaffold(
      backgroundColor: onPrimaryColor,
      appBar: AppBar(
        backgroundColor: onPrimaryColor,
        title: Text(
          "BMI CALCULATOR",
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: ListView(
          children: [
            GenderPicker(
              selectedGender: _selectedGender,
              toMale: toMale,
              toFemale: toFemale,
            ),
            HeightPicker(
              height: _height,
              controller: _heightController,
              onSubmitted: saveHeight,
            ),
            WeightAndAgePicker(
              weightController: _weightController,
              ageController: _ageController,
              weight: _weight,
              age: _age,
              onSubmittedAge: saveAge,
              onSubmittedWeight: saveWeight,
            ),
            ShowBMI(
              bmi: _bmi,
              bmiStatus: _bmiStatus,
            ),
          ],
        ),
      ),
    );
  }

  // Functions

  void toMale() {
    setState(() {
      _selectedGender = 0;
    });
  }

  void toFemale() {
    setState(() {
      _selectedGender = 1;
    });
  }

  void saveHeight(value) {
    setState(() {
      _height = int.tryParse(_heightController.text);
    });
    if (_age != null && _height != null && _weight != null) {
      bmiCalculate();
    }
    _heightController.clear();
  }

  void saveWeight(value) {
    setState(() {
      _weight = int.tryParse(_weightController.text);
    });
    if (_age != null && _height != null && _weight != null) {
      bmiCalculate();
    }
    _weightController.clear();
  }

  void saveAge(value) {
    setState(() {
      _age = int.tryParse(_ageController.text);
    });
    if (_age != null && _height != null && _weight != null) {
      bmiCalculate();
    }
    _ageController.clear();
  }

  void bmiCalculate() {
    setState(() {
      _bmi = _weight! / pow(_height! / 100, 2);
      if (_bmi! < 18.5) {
        _bmiStatus = "Underweight";
      } else if (_bmi! < 24.9) {
        _bmiStatus = "Normal weight";
      } else if (_bmi! < 29.9) {
        _bmiStatus = "Overweight";
      } else if (_bmi! > 30) {
        _bmiStatus = "Obese";
      }
    });
  }
}
