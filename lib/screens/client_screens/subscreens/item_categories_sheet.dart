import 'package:ecommerce_app/components/bordered_container.dart';
import 'package:ecommerce_app/components/circle_container.dart';
import 'package:ecommerce_app/components/customer_text.dart';
import 'package:ecommerce_app/models/categories_model.dart';
import 'package:ecommerce_app/utils/constants/categories_data.dart';
import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class TopCategories extends StatefulWidget {
  const TopCategories({super.key});

  @override
  State<TopCategories> createState() => _TopCategoriesState();
}

class _TopCategoriesState extends State<TopCategories> {
  String selected = "";
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return CCircle(
      theme: themeData.highlightColor,
      circle: 24,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        CCircle(
          theme: Colors.transparent,
          circle: 24,
          height: 320,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
            child: LayoutBuilder(builder: (context, constaints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constaints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: CText(
                            text: "Select Categories",
                            fontWeight: FontWeight.w900,
                            size: 18,
                          ),
                        ),
                        const Spacer(),
                        Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.center,
                          children: [
                            for (CategoriesModel categoriesModel in CategoriesData.categories) ...[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: TouchableOpacity(
                                  onTap: () => setState(() {
                                    selected.isNotEmpty && selected == categoriesModel.text?
                                      selected = "":
                                      selected = categoriesModel.text;
                                    
                                  }),
                                  child: CBCircle(
                                    theme: selected == categoriesModel.text ? themeData.primaryColor : themeData.focusColor,
                                    border: 50,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                                      child: CText(
                                        text: categoriesModel.text,
                                        color: selected == categoriesModel.text ? themeData.highlightColor : themeData.hintColor.withValues(alpha: 0.6),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        Center(
            child: TouchableOpacity(
              onTap: () => Navigator.pop(context),
              child: CCircle(
                        theme: selected.isEmpty ? themeData.hintColor.withValues(alpha: 0.2) : themeData.primaryColor,
                        width: 180,
                        child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: CText(
                text: "SAVE & CLOSE",
                fontWeight: selected.isEmpty ? FontWeight.w700: FontWeight.normal,
                color: selected.isEmpty ? themeData.hintColor.withValues(alpha: 0.4) : themeData.highlightColor,
              ),
                        ),
                      ),
            ))
      ]),
    );
  }
}
