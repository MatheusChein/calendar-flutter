import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';

import '../constants/colors.dart';
import 'custom_text.dart';

class TimeSlot extends StatefulWidget {
  final String label;
  final Function() onTap;
  final Color color;
  final Color hoveringColor;
  final bool isSelected;

  const TimeSlot({
    Key? key,
    required this.label,
    required this.onTap,
    this.color = primaryColor,
    this.hoveringColor = Colors.white,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<TimeSlot> createState() => _TimeSlotState();
}

class _TimeSlotState extends State<TimeSlot> {
  bool isHovering = false;

  void onEntered(bool isHovering) {
    setState(() {
      this.isHovering = isHovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..translate(0, -4);
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
            color: widget.isSelected
                ? widget.color
                : isHovering
                    ? widget.hoveringColor
                    : widget.color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: primaryColor, width: 2)),
        child: CustomText(
          label: widget.label,
          color: widget.isSelected
              ? widget.hoveringColor
              : isHovering
                  ? widget.color
                  : widget.hoveringColor,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
