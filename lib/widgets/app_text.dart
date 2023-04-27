import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String title;
  final double textSize;
  final Color color;
  final FontWeight fontWeight;
  final TextDecoration textDecoration;
  const AppText({
    super.key,
    required this.title,
    this.textSize = 14,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.textDecoration = TextDecoration.none,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        decoration: textDecoration,
        fontSize: textSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}