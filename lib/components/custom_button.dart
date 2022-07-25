import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';

import '../constants/colors.dart';
import 'custom_text.dart';

class CustomButton extends StatefulWidget {
  final String label;
  final Function() onTap;
  final Color color;
  final Color hoveringColor;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.color = primaryColor,
    this.hoveringColor = Colors.white,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isHovering = false;

  void onEntered(bool isHovering) {
    setState(() {
      this.isHovering = isHovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..scale(1.2);
    final transform = isHovering ? hoveredTransform : Matrix4.identity();

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      mouseCursor: SystemMouseCursors.click,
      onHover: (event) => onEntered(event),
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Sprung.overDamped,
        transform: transform,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
        decoration: BoxDecoration(
          color: isHovering ? widget.hoveringColor : widget.color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 6),
              color: boxShadowColor,
              blurRadius: 12,
            )
          ],
        ),
        child: CustomText(
          label: widget.label,
          color: isHovering ? widget.color : widget.hoveringColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
