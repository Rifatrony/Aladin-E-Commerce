import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const TitleText({
    super.key,
    required this. title,
    required this. fontSize,
    this. fontWeight = FontWeight.w500,
    this. color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize, 
        fontWeight: fontWeight,
        color: color
      ),
    );
  }
}
