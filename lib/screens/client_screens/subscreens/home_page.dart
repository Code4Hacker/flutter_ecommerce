import 'dart:math';

import 'package:ecommerce_app/components/app_bar.dart';
import 'package:ecommerce_app/components/bordered_container.dart';
import 'package:ecommerce_app/components/circle_container.dart';
import 'package:ecommerce_app/components/customer_text.dart';
import 'package:ecommerce_app/components/half_tour.container.dart';
import 'package:ecommerce_app/components/mini_tour_container.dart';
import 'package:ecommerce_app/screens/client_screens/subscreens/item_categories_sheet.dart';
import 'package:ecommerce_app/utils/constants/categories_data.dart';
import 'package:ecommerce_app/utils/constants/customer_filter_list.dart';
import 'package:ecommerce_app/utils/constants/sample_array_image.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({super.key, required this.theme});
  ThemeData theme;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _enabled = true;
  String username = "Gemini", active = "home", filterLocation = "All Locations";
  int halfData = ImageArray.list.length ~/ 2;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _enabled = false;
      });
    });
  }

  List<Color> containerColors = List.generate(5, (index) {
    return Color.fromARGB(
      172,
      ((Random()).nextInt(240) + 14),
      ((Random()).nextInt(240) + 14),
      ((Random()).nextInt(240) + 14),
    );
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CAppBar(theme: widget.theme),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => Skeletonizer(
                      enabled: _enabled,
                      containersColor: widget.theme.primaryColor.withValues(alpha: 0.1),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12, right: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CText(text: "Hello, $username", fontWeight: FontWeight.w900, size: 20, color: widget.theme.hintColor.withValues(alpha: 1)),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Image.asset(
                                        "assets/waving.png",
                                        width: 18,
                                      ),
                                    ),
                                    const Spacer()
                                  ],
                                ),
                                CText(text: "Let’s start shopping!", color: widget.theme.hintColor.withValues(alpha: 0.6)),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Row(
                              children: [
                                for (int i = 1; i < ImageArray.list.length; i++) ...[
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: MiniTourContainer(
                                        list: ImageArray.list[i],
                                        color: containerColors[i],
                                      ))
                                ]
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            child: Row(
                              children: [
                                CText(text: "Top Categories", fontWeight: FontWeight.w900, size: 16, color: widget.theme.hintColor.withValues(alpha: 1)),
                                const Spacer(),
                                TouchableOpacity(
                                  onTap: () => showModalBottomSheet(
                                    context: context,
                                    showDragHandle: true,
                                    builder: (context) => TopCategories(),
                                    backgroundColor: Colors.transparent
                                  ),
                                  child: CText(
                                    text: "View All",
                                    color: widget.theme.primaryColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Row(
                                children: [
                                  for (int i = 0; i < 7; i++) ...[
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: CBCircle(
                                        theme: widget.theme.indicatorColor.withValues(alpha: 0.6),
                                        bWidth: 1,
                                        borderColor: widget.theme.indicatorColor,
                                        border: 12,
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: HugeIcon(icon: CategoriesData.categories[i].icon, color: widget.theme.hintColor.withValues(alpha: 0.3)),
                                        ),
                                      ),
                                    )
                                  ]
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12, bottom: 8),
                            child: SizedBox(
                              width: double.infinity,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsetsDirectional.only(start: 12),
                                child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  for (int i = 0; i < Filter.filterList.length; i++) ...[
                                    TouchableOpacity(
                                      child: Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: CBCircle(
                                          theme: i == 0 ? widget.theme.primaryColor : widget.theme.primaryColor.withValues(alpha: 0.1),
                                          height: 42,
                                          border: 50,
                                          padding: 4,
                                          bWidth: 1,
                                          borderColor: widget.theme.primaryColor.withValues(alpha: 0.2),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              CCircle(
                                                theme: widget.theme.highlightColor,
                                                width: 32,
                                                height: 32,
                                                child: HugeIcon(icon: Filter.filterList[i].icon, size: 18, color: widget.theme.hintColor.withValues(alpha: 0.6)),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 4.0, right: 12),
                                                child: CText(
                                                  text: Filter.filterList[i].title,
                                                  size: 12,
                                                  color: i == 0 ? widget.theme.highlightColor : widget.theme.hintColor.withValues(alpha: .6).withValues(alpha: 0.8),
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ]
                                ]),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 0,
                                    ),
                                    for (int i = 0; i < ImageArray.list.length / 2; i++) ...[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TweenAnimationBuilder<double>(
                                            tween: Tween<double>(begin: 0.0, end: 1.0),
                                            curve: Curves.ease,
                                            duration: Duration(seconds: 2 * i),
                                            builder: (context, double opacity, Widget? child) {
                                              return Opacity(opacity: opacity, child: TouchableOpacity(child: HTourContainer(list: ImageArray.list[i])));
                                            }),
                                      )
                                    ]
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    for (int i = ImageArray.list.length ~/ 2; i < ImageArray.list.length; i++) ...[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TweenAnimationBuilder<double>(
                                            tween: Tween<double>(begin: 0.0, end: 1.0),
                                            curve: Curves.ease,
                                            duration: Duration(seconds: 2 * i),
                                            builder: (context, double opacity, Widget? child) {
                                              return Opacity(opacity: opacity, child: TouchableOpacity(child: HTourContainer(list: ImageArray.list[i])));
                                            }),
                                      )
                                    ]
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                childCount: 1))
      ],
    );
  }
}
