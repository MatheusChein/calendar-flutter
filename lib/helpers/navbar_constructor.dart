import 'package:flutter/material.dart';

import '../components/responsive.dart';
import '../components/logo.dart';
import '../components/custom_button.dart';

Widget navbarConstructor(BuildContext context, GlobalKey<ScaffoldState> key) {
  if (ResponsiveWidget.isLargeScreen(context) ||
      ResponsiveWidget.isMediumScreen(context)) {
    return Row(
      children: [
        const Spacer(),
        CustomButton(
          label: 'Logout',
          onTap: () {
            print('logout');
          },
        )
      ],
    );
  }

  return Row(
    children: [
      const Spacer(),
      Logo(
        hasLabel: ResponsiveWidget.isSmallScreen(context) ? true : false,
      )
    ],
  );
}
