import 'package:ecommerce_app/components/customer_text.dart';
import 'package:ecommerce_app/utils/constants/sample_array_image.dart';
import 'package:flutter/material.dart';

class TourContainer extends StatelessWidget {
  const TourContainer({super.key, required this.list});
  final ImageModal list;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      height: 240,
      decoration: BoxDecoration(color: theme.focusColor.withOpacity(0.5), borderRadius: BorderRadius.circular(24), image: DecorationImage(image: AssetImage(list.path), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
          Theme.of(context).hintColor.withOpacity(0.4),
          Theme.of(context).hintColor.withOpacity(0.6),
        ])),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              CText(
                text: list.title.toUpperCase(),
                color: theme.highlightColor,
                fontWeight: FontWeight.w900,
                size: 16,
              ),
              CText(
                text: list.description,
                color: theme.highlightColor.withOpacity(0.8),
                fontWeight: FontWeight.w300,
                size: 14,
              )
            ],
          ),
        ),
      ),
    );
  }
}
