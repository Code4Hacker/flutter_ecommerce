
import 'package:ecommerce_app/components/circle_container.dart';
import 'package:flutter/material.dart';

class BackGroundBalls extends StatelessWidget {
  const BackGroundBalls({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    
    Row(
      children: [
        const Spacer(),
        CCircle(
          theme: theme.primaryColor.withOpacity(0.4),
          height: 200,
          width: 200,
        )
      ],
    ),
    const Spacer(),
    Row(
      children: [
        CCircle(
          theme: theme.primaryColor.withOpacity(0.4),
          height: 240,
          width: 240,
        ),
        CCircle(
          theme: theme.primaryColorDark.withOpacity(0.4),
          height: 140,
          width: 140,
        )
      ],
    ),
      ],
    );
  }
}
