import 'dart:ui';

import 'package:flutter/material.dart';

class CCircle extends StatelessWidget {
  const CCircle({super.key, this.theme, this.child, this.height, this.width, this.circle});

  final Color? theme;
  final Widget? child;
  final double? height;
  final double? width;
  final double? circle;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Durations.short3,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(circle ?? 350),
        color: theme?? Colors.white,
      ),
      child: BackdropFilter(filter: ImageFilter.blur(), child: Center(child: child)),
    );
  }
}
