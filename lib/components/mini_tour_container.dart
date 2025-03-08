import 'package:ecommerce_app/components/circle_container.dart';
import 'package:ecommerce_app/components/customer_text.dart';
import 'package:ecommerce_app/utils/constants/sample_array_image.dart';
import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class MiniTourContainer extends StatelessWidget {
  const MiniTourContainer({super.key, required this.list, required this.color});
  final ImageModal list;
  final Color color;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return TouchableOpacity(
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: MediaQuery.of(context).size.width - 100,
        height: 140,
        decoration: BoxDecoration(color: theme.focusColor.withValues(alpha: 0.5), borderRadius: BorderRadius.circular(24), image: DecorationImage(image: AssetImage(list.path), fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
            Colors.transparent,
            Theme.of(context).primaryColor.withValues(alpha: 0.4),
            Theme.of(context).primaryColor.withValues(alpha: .6),
          ])),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CText(
                  text: list.title.toUpperCase(),
                  color: theme.highlightColor,
                  fontWeight: FontWeight.w900,
                  size: 16,
                ),
                CText(
                  text: list.title,
                  color: theme.highlightColor.withValues(alpha: 0.6),
                  size: 14,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: CCircle(
                    theme: theme.highlightColor,
                    circle: 50,
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CText(
                        text: "Get Now",
                        fontWeight: FontWeight.bold,
                        size: 12,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
