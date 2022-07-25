import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';
import 'package:url_launcher/link.dart';

import '../constants/colors.dart';

class SocialIcon extends StatefulWidget {
  const SocialIcon({
    Key? key,
    required this.icon,
    required this.url,
  }) : super(key: key);

  final String url;
  final IconData icon;

  @override
  State<SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  bool isHovering = false;

  void onEntered(bool isHovering) {
    setState(() {
      this.isHovering = isHovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..translate(0, -8);
    final transform = isHovering ? hoveredTransform : Matrix4.identity();

    return Link(
      uri: Uri.parse(widget.url),
      target: LinkTarget.blank,
      builder: (context, followLink) => InkWell(
        hoverColor: Colors.transparent,
        onHover: (event) => onEntered(event),
        mouseCursor: SystemMouseCursors.click,
        onTap: followLink,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Sprung.overDamped,
          transform: transform,
          child: Icon(
            widget.icon,
            color: primaryColor,
            size: 32,
          ),
        ),
      ),
    );
  }
}
