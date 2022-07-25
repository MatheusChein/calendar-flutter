import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../helpers/gradient.dart';
import 'custom_button.dart';
import 'logo.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Container build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: linearGradientColors(
          [
            opaquePrimaryColor,
            accentColor,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Logo(
            hasLabel: false,
          ),
          const SizedBox(
            height: 24,
          ),
          CustomButton(
            label: 'Logout',
            onTap: () {
              print('logout');
            },
          )
        ],
      ),
    );
  }
}
