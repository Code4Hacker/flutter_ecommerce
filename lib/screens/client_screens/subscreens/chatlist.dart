import 'dart:ui';
import 'package:ecommerce_app/components/bordered_container.dart';
import 'package:ecommerce_app/components/circle_container.dart';
import 'package:ecommerce_app/components/customer_text.dart';
import 'package:ecommerce_app/components/half_tour.container.dart';
import 'package:ecommerce_app/screens/client_screens/subscreens/item_categories_sheet.dart';
import 'package:ecommerce_app/utils/constants/categories_data.dart';
import 'package:ecommerce_app/utils/constants/customer_filter_list.dart';
import 'package:ecommerce_app/utils/constants/headlines.dart';
import 'package:ecommerce_app/utils/constants/route_statics.dart';
import 'package:ecommerce_app/utils/constants/routes_values.dart';
import 'package:ecommerce_app/utils/constants/sample_array_image.dart';
import 'package:ecommerce_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

// ignore: must_be_immutable
class ChatListScreen extends StatefulWidget {
  ChatListScreen({super.key, required this.theme});
  ThemeData theme;

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
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
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (int i = 0; i < 12; i++) ...[
                  TouchableOpacity(
                    onTap: () => Navigator.pushNamed(context, RouteStatics.chat),
                    child: CBCircle(
                      theme: i%2==0 ? widget.theme.highlightColor:widget.theme.primaryColor.withValues(alpha: .1),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                        child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CText(
                                  text: "Chart One ID".toUpperCase(),
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                            CText(
                              text: Headlines.lorem.length > 80 ? "${Headlines.lorem.substring(0, 80)}...":Headlines.lorem,
                              fontWeight: FontWeight.w400,
                              color: widget.theme.hintColor.withValues(alpha: .4),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ]
              ],
            ),
          ),
        ));
  }
}
