import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';
import 'package:url_launcher/link.dart';

import 'custom_text.dart';

class HoverLink extends StatefulWidget {
  const HoverLink({
    Key? key,
    required this.label,
    required this.color,
    required this.hoveringColor,
    this.fontWeight = FontWeight.normal,
    required this.url,
  }) : super(key: key);

  final String label;
  final Color color;
  final Color hoveringColor;
  final FontWeight fontWeight;
  final String url;

  @override
  State<HoverLink> createState() => _HoverLinkState();
}

class _HoverLinkState extends State<HoverLink> {
  bool isHovering = false;

  void onEntered(bool isHovering) {
    setState(() {
      this.isHovering = isHovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..translate(0, -3);
    final transform = isHovering ? hoveredTransform : Matrix4.identity();

    return Link(
      uri: Uri.parse(widget.url),
      builder: (context, followLink) => InkWell(
        hoverColor: Colors.transparent,
        focusColor: widget.hoveringColor,
        borderRadius: BorderRadius.circular(8),
        onHover: (event) => onEntered(event),
        mouseCursor: SystemMouseCursors.click,
        onTap: followLink,
        child: AnimatedContainer(
          padding: const EdgeInsets.all(2),
          duration: const Duration(milliseconds: 200),
          curve: Sprung.overDamped,
          transform: transform,
          child: CustomText(
            label: widget.label,
            fontWeight: widget.fontWeight,
            color: isHovering ? widget.hoveringColor : widget.color,
          ),
        ),
      ),
    );
  }
}
