import 'package:ecommerce_app/components/circle_container.dart';
import 'package:ecommerce_app/components/customer_text.dart';
import 'package:ecommerce_app/screens/client_screens/subscreens/slug_field.dart';
import 'package:ecommerce_app/utils/constants/sample_array_image.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class HTourContainer extends StatelessWidget {
  const HTourContainer({super.key, required this.list});
  final ImageModal list;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return TouchableOpacity(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SlugField(theme: theme, list: list),)),
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: (MediaQuery.of(context).size.width / 2) - 4,
        height: 180,
        decoration: BoxDecoration(color: theme.focusColor.withValues(alpha: 0.5), borderRadius: BorderRadius.circular(24), image: DecorationImage(image: AssetImage(list.path), fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
            Theme.of(context).hintColor.withValues(alpha: 0.2),
            Theme.of(context).hintColor.withValues(alpha: 0.2),
          ])),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ((int.parse(list.discount) / int.parse(list.price)) * 100).toInt() > 0
                    ? CCircle(
                        theme: theme.focusColor,
                        width: 60,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: HugeIcon(
                                icon: HugeIcons.strokeRoundedDiscount,
                                color: theme.primaryColor,
                                size: 16,
                              ),
                            ),
                            CText(
                              text: "${((int.parse(list.discount) / int.parse(list.price)) * 100).toInt()}%",
                              fontWeight: FontWeight.w900,
                              color: theme.primaryColor,
                            ),
                          ],
                        ),
                      )
                    : Text(""),
                const Spacer(),
                CText(
                  text: list.title.toUpperCase(),
                  color: theme.highlightColor,
                  fontWeight: FontWeight.w900,
                  size: 14,
                ),
                if (list.isProduct == "true") ...[
                  CText(
                    text: "${list.price}Tshs.",
                    color: theme.highlightColor.withValues(alpha: 0.8),
                    fontWeight: FontWeight.w300,
                    size: 12,
                  )
                ] else ...[
                  CText(
                    text: list.description.length > 20 ? "${list.description.substring(0, 20)}..." : list.description,
                    color: theme.highlightColor.withValues(alpha: 0.8),
                    fontWeight: FontWeight.w300,
                    size: 12,
                  )
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
