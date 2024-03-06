import 'package:flutter/material.dart';

Widget plant_category_card(
  IconData icon,
  String text,
  Color iconColor,
  // Function onTap
) {
  return TextButton(
    onPressed: () {},
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.all(10.0),
          child: Icon(
            icon,
            color: iconColor,
            size: 40.0,
          ),
        ),
        const SizedBox(height: 3.0),
        Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    ),
  );
}
