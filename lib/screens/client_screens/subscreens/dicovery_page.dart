import 'dart:ui';
import 'package:ecommerce_app/components/bordered_container.dart';
import 'package:ecommerce_app/components/circle_container.dart';
import 'package:ecommerce_app/components/customer_text.dart';
import 'package:ecommerce_app/components/half_tour.container.dart';
import 'package:ecommerce_app/screens/client_screens/subscreens/item_categories_sheet.dart';
import 'package:ecommerce_app/utils/constants/categories_data.dart';
import 'package:ecommerce_app/utils/constants/customer_filter_list.dart';
import 'package:ecommerce_app/utils/constants/routes_values.dart';
import 'package:ecommerce_app/utils/constants/sample_array_image.dart';
import 'package:ecommerce_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

// ignore: must_be_immutable
class DiscoveryPage extends StatefulWidget {
  DiscoveryPage({super.key, required this.theme});
  ThemeData theme;

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  TextEditingController search = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  bool _enabled = true;
  String active = RouteValues.home;
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _enabled = false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    search.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: _enabled,
      containersColor: widget.theme.primaryColor.withValues(alpha: .1),
      child: Stack(
        children: [
          CustomScrollView(
                      slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
          padding: const EdgeInsets.only(top: 150),
          // width: MediaQuery.of(context).size.width,
          child: Column(
            children: [

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
                        Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 8),
                          child: SizedBox(
                            width: double.infinity,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsetsDirectional.only(start: 12),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                                
                              ]),
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
                          height: 54,
                        ),
                        for (int i = 0; i < ImageArray.list.length; i++) ...[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TweenAnimationBuilder<double>(
                              tween: Tween<double>(begin: 0.0, end: 1.0),
                              curve: Curves.ease,
                              duration: Duration(seconds: 2*i),
                              builder: (context, double opacity, Widget? child) {
                                return Opacity(
                                  opacity: opacity,
                                  child: TouchableOpacity(child: HTourContainer(list: ImageArray.list[i])));
                              }
                            ),
                          )
                        ]
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        for (int i = 0; i < ImageArray.list.length; i++) ...[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TweenAnimationBuilder<double>(
                              tween: Tween<double>(begin: 0.0, end: 1.0),
                              curve: Curves.ease,
                              duration: Duration(seconds: 2*i),
                              builder: (context, double opacity, Widget? child) {
                                return Opacity(
                                  opacity: opacity,
                                  child: TouchableOpacity(child: HTourContainer(list: ImageArray.list[i])));
                              }
                            ),
                          )
                        ]
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
                      ),
                    
          )
                      ]),
          Column(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // CSearchBar(placeholder: "placeholder", textEditingController: TextEditingController()),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Center(
                              child: CText(
                            text: "Discovery".toUpperCase(),
                            color: widget.theme.primaryColor,
                            fontWeight: FontWeight.w300,
                            size: 24,
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 12, right: 12),
                          child: CBCircle(
                            theme: widget.theme.focusColor.withValues(alpha:0.2),
                            height: 48,
                            width: double.infinity,
                            border: 50,
                            bWidth: 1.4,
                            borderColor: _isFocused ? widget.theme.primaryColor.withValues(alpha:0.2) : widget.theme.primaryColor.withValues(alpha:0.2),
                            child: Stack(
                              alignment: Alignment.centerRight,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: TextField(
                                    controller: search,
                                    focusNode: _focusNode,
                                    style: Styles.input(widget.theme.primaryColor, context, 13, FontWeight.normal),
                                    cursorColor: widget.theme.primaryColor,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Search Tour...",
                                      hintStyle: Styles.input(widget.theme.primaryColor.withValues(alpha:0.4), context, 13, FontWeight.normal),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 4.0),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(color: widget.theme.primaryColor, borderRadius: BorderRadius.circular(50)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.search,
                                        color: widget.theme.highlightColor,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                          
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
        ],
      ),
    );
  }
}
