// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class GenderPicker extends StatelessWidget {
  final int selectedGender;
  final void Function()? toMale;
  final void Function()? toFemale;

  const GenderPicker(
      {super.key,
      required this.selectedGender,
      required this.toMale,
      required this.toFemale});

  @override
  Widget build(BuildContext context) {
    var onPrimaryColor = Theme.of(context).colorScheme.onPrimary;
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        children: [
          Text(
            selectedGender == 0 ? "Male" : "Female",
            style: TextStyle(fontSize: 20.0, color: onPrimaryColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              maleGender(context),
              femaleGender(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget femaleGender(BuildContext context) {
    var onPrimaryColor = Theme.of(context).colorScheme.onPrimary;
    return GestureDetector(
      onTap: toFemale,
      child: Column(
        children: [
          Icon(
            Icons.female,
            size: 50,
            color: selectedGender == 1 ? onPrimaryColor : Colors.black,
          ),
          Text("Female",
              style: TextStyle(
                fontSize: 20.0,
                color: selectedGender == 1 ? onPrimaryColor : Colors.black,
              ))
        ],
      ),
    );
  }

  Widget maleGender(BuildContext context) {
    var onPrimaryColor = Theme.of(context).colorScheme.onPrimary;
    return GestureDetector(
      onTap: toMale,
      child: Column(children: [
        Icon(
          Icons.male,
          size: 50,
          color: selectedGender == 0 ? onPrimaryColor : Colors.black,
        ),
        Text(
          "Male",
          style: TextStyle(
              fontSize: 20.0,
              color: selectedGender == 0 ? onPrimaryColor : Colors.black),
        ),
      ]),
    );
  }
}
