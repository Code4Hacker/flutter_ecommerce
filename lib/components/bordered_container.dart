import 'package:flutter/material.dart';

class CBCircle extends StatelessWidget {
  const CBCircle({super.key, this.theme, this.child, this.height, this.width, this.border, this.borderColor, this.bWidth, this.padding});

  final Color? theme;
  final Widget? child;
  final double? height;
  final double? width;
  final double? border;
  final Color? borderColor;
  final double? bWidth;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Durations.short4,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(border ?? 0),
        border: Border.all(width: bWidth ?? 0, color: borderColor ?? Colors.grey),
        color: theme??Theme.of(context).highlightColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding??0, vertical: 0),
        child: child,
      ),
    );
  }
}