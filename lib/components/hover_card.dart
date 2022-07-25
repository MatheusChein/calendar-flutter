import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';

class HoverCard extends StatefulWidget {
  const HoverCard({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool isHovering = false;

  void onEntered(bool isHovering) {
    setState(() {
      this.isHovering = isHovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..translate(0, -20);
    final transform = isHovering ? hoveredTransform : Matrix4.identity();

    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Sprung.overDamped,
        transform: transform,
        child: widget.child,
      ),
    );
  }
}
