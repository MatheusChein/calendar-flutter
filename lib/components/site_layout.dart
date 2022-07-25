import 'package:flutter/material.dart';

import 'side_menu.dart';
import 'navbar.dart';

import '../../helpers/gradient.dart';

import '../../constants/colors.dart';

class SiteLayout extends StatelessWidget {
  SiteLayout({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: linearGradientColors(
          [
            opaquePrimaryColor,
            accentColor,
          ],
        ),
      ),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.transparent,
        drawer: const Drawer(
          width: 200,
          child: SideMenu(),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
              [navigationBar(context, scaffoldKey)],
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: children,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
