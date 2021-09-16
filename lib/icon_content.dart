import 'package:flutter/material.dart';

const TextStyle labelStyle = TextStyle(
  color: Color(0xFF8D8E98),
  fontSize: 18.0
);
const double iconSize = 80.0;
const double sizedBoxHeight = 15.0;

class IconContent extends StatelessWidget {

  final IconData icon;
  final String label;

  IconContent({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon, 
          size: iconSize,
        ),
        SizedBox(
          height: sizedBoxHeight,
        ),
        Text(
          label,
          style: labelStyle,
        ),
      ],
    );
  }
}