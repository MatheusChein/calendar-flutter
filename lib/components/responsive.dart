import 'package:flutter/material.dart';

const int largeScreenSize = 1160;
const int smallScreenSize = 520;
const int mediumScreenSize = 960;

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
  }) : super(key: key);

  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width <= mediumScreenSize &&
      MediaQuery.of(context).size.width > smallScreenSize;

  static bool isExtraSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width <= smallScreenSize;

  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > mediumScreenSize &&
      MediaQuery.of(context).size.width <= largeScreenSize;

  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > largeScreenSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (isLargeScreen(context)) {
        return largeScreen;
      }

      if (isMediumScreen(context)) {
        return mediumScreen ?? largeScreen;
      }

      return smallScreen ?? largeScreen;
    }));
  }
}
