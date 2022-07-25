import 'package:flutter/material.dart';
import 'package:calendar_app/components/responsive.dart';
import 'package:calendar_app/helpers/navbar_constructor.dart';

import '../constants/colors.dart';
import 'logo.dart';

SliverAppBar navigationBar(
  BuildContext context,
  GlobalKey<ScaffoldState> key,
) {
  double width = MediaQuery.of(context).size.width;

  return SliverAppBar(
    elevation: 0,
    toolbarHeight: 130,
    leadingWidth: 500,
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    leading: ResponsiveWidget.isLargeScreen(context) ||
            ResponsiveWidget.isMediumScreen(context)
        ? Container(
            padding: const EdgeInsets.only(left: 100),
            child: const Logo(),
          )
        : IconButton(
            onPressed: () {
              key.currentState?.openDrawer();
            },
            icon: const Icon(Icons.menu),
            color: primaryColor,
          ),
    title: Container(
      padding: EdgeInsets.only(
        right: width / 18,
      ),
      child: navbarConstructor(context, key),
    ),
  );
}
