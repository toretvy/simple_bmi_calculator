// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HeightPicker extends StatelessWidget {
  final int? height;
  final TextEditingController controller;
  final void Function(String)? onSubmitted;

  const HeightPicker(
      {super.key,
      required this.height,
      required this.controller,
      required this.onSubmitted});

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
            "Height (cm)",
            style: TextStyle(color: onPrimaryColor, fontSize: 20.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            controller: controller,
            onSubmitted: onSubmitted,
            textAlign: TextAlign.center,
            style: TextStyle(color: onPrimaryColor),
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: onPrimaryColor, width: 1.0),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: onPrimaryColor, width: 1.0),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                )),
            cursorColor: onPrimaryColor,
            cursorWidth: 1.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            height == null ? "" : "$height cm",
            style: TextStyle(color: onPrimaryColor, fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
