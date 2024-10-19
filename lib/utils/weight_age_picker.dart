// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class WeightAndAgePicker extends StatelessWidget {
  final TextEditingController weightController;
  final TextEditingController ageController;
  final int? weight;
  final int? age;
  final void Function(String)? onSubmittedWeight;
  final void Function(String)? onSubmittedAge;

  const WeightAndAgePicker(
      {super.key,
      required this.weightController,
      required this.ageController,
      required this.weight,
      required this.age,
      required this.onSubmittedWeight,
      required this.onSubmittedAge});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          weightPicker(context),
          agePicker(context),
        ],
      ),
    );
  }

  Widget weightPicker(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    var onPrimaryColor = Theme.of(context).colorScheme.onPrimary;

    return Container(
      width: MediaQuery.sizeOf(context).width * 0.44,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        children: [
          Text(
            "Weight (kg)",
            style: TextStyle(color: onPrimaryColor, fontSize: 20.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            controller: weightController,
            onSubmitted: onSubmittedWeight,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: onPrimaryColor),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: onPrimaryColor),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                )),
            style: TextStyle(color: onPrimaryColor),
            textAlign: TextAlign.center,
            cursorColor: onPrimaryColor,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            weight == null ? "" : "$weight kg",
            style: TextStyle(color: onPrimaryColor, fontSize: 16.0),
          ),
        ],
      ),
    );
  }

  Widget agePicker(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    var onPrimaryColor = Theme.of(context).colorScheme.onPrimary;

    return Container(
      width: MediaQuery.sizeOf(context).width * 0.44,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        children: [
          Text(
            "Age",
            style: TextStyle(color: onPrimaryColor, fontSize: 20.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            controller: ageController,
            onSubmitted: onSubmittedAge,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: onPrimaryColor),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: onPrimaryColor),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                )),
            style: TextStyle(color: onPrimaryColor),
            textAlign: TextAlign.center,
            cursorColor: onPrimaryColor,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            age == null ? "" : "$age years old",
            style: TextStyle(color: onPrimaryColor, fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
