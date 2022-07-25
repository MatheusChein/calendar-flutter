import 'package:flutter/material.dart';

import '../constants/colors.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
    this.width = 100,
    this.height = 100,
    this.fontSize = 20,
    this.hasLabel = true,
  }) : super(key: key);

  final double width;
  final double height;
  final double fontSize;
  final bool hasLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: width,
          height: height,
        ),
        hasLabel
            ? Text(
                'EasyCalendar',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: fontSize,
                  color: primaryColor,
                ),
              )
            : Container()
      ],
    );
  }
}
