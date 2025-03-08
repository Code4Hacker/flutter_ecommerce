import 'package:ecommerce_app/components/bordered_container.dart';
import 'package:ecommerce_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

// ignore: must_be_immutable
class CSearchBar extends StatelessWidget {
  CSearchBar({super.key, required this.placeholder, required this.textEditingController});
  final String placeholder;
  TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: CBCircle(
        border: 50,
        theme: theme.highlightColor,
        bWidth: 1,
        borderColor: theme.primaryColor.withValues(alpha: 0.15),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 2, bottom: 0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: Styles.onlyStyle(theme.primaryColor.withValues(alpha: 0.8), context, 12, FontWeight.normal),
                    decoration: InputDecoration(
                      hintText: placeholder,
                      hintStyle: Styles.onlyStyle(theme.hintColor.withValues(alpha: 0.5), context, 12, FontWeight.normal),
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedSearch01,
                    color: theme.hintColor.withValues(alpha: 0.4),
                    size: 18,
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
