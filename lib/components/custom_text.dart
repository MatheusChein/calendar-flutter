import 'package:flutter/material.dart';
import 'package:calendar_app/constants/colors.dart';

class CustomText extends StatelessWidget {
  final String label;
  final double size;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final double wordSpacing;

  const CustomText({
    Key? key,
    required this.label,
    this.size = 16,
    this.color = primaryTextColor,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.wordSpacing = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
        wordSpacing: wordSpacing,
      ),
    );
  }
}
