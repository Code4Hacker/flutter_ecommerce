import 'package:ecommerce_app/components/customer_text.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class CAppBar extends StatelessWidget {
  const CAppBar({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      snap: false,
      backgroundColor: theme.highlightColor,
      pinned: true,
      floating: true,
      title: Row(
        children: [
          CircleAvatar(backgroundColor: theme.indicatorColor),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CText(text:"Interact App", size: 16,),
          )
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: TouchableOpacity(child: HugeIcon(icon:HugeIcons.strokeRoundedSearch01, color: theme.hintColor, size: 18, )),
        ),
         Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: TouchableOpacity(child: HugeIcon(icon:HugeIcons.strokeRoundedNotification01, color: theme.hintColor, size: 18, )),
        ),
         Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: TouchableOpacity(child: HugeIcon(icon:HugeIcons.strokeRoundedFavourite, color: theme.hintColor, size: 18, )),
        ),
        
      ],
    );
  }
}