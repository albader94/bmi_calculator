import 'package:flutter/material.dart';

const double containerMargin = 15.0;
const double borderRadius = 10.0;

class ReusableCard extends StatelessWidget {
  
  final Color cardColor;
  final Widget cardWidget;
  Function onPress;

  ReusableCard({@required this.cardColor, this.cardWidget, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(containerMargin),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: cardWidget,
      ),
    );
  }
}
