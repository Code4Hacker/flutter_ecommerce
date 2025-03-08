import 'package:ecommerce_app/components/bordered_container.dart';
import 'package:ecommerce_app/components/circle_container.dart';
import 'package:ecommerce_app/components/customer_text.dart';
import 'package:ecommerce_app/screens/client_screens/subscreens/chatscreen.dart';
import 'package:ecommerce_app/utils/constants/route_statics.dart';
import 'package:ecommerce_app/utils/constants/sample_array_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class SingleSlug extends StatefulWidget {
  const SingleSlug({
    super.key,
    required this.theme,
    required this.list,
  });

  final ThemeData theme;
  final ImageModal list;

  @override
  State<SingleSlug> createState() => _SingleSlugState();
}

class _SingleSlugState extends State<SingleSlug> {
  bool _enabled = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _enabled = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CCircle(
          theme: widget.theme.highlightColor,
          height: double.infinity,
          circle: 0,
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 200,
                    snap: false,
                    foregroundColor: widget.theme.highlightColor,
                    backgroundColor: widget.theme.primaryColor,
                    floating: true,
                    pinned: true,
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CText(
                        text: widget.list.title,
                        size: 16,
                        fontWeight: FontWeight.w900,
                        color: widget.theme.highlightColor,
                      ),
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      background: SizedBox(
                        height: MediaQuery.of(context).size.height * .3,
                        child: PageView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) => Image.asset(
                            widget.list.path,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * .3,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    childCount: 1,
                    addAutomaticKeepAlives: false,
                    addRepaintBoundaries: false,
                    (context, index) => Skeletonizer(
                      enabled: _enabled,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12, top: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    spacing: 8,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CText(
                                        text: "${widget.list.title}",
                                        size: 24,
                                        fontWeight: FontWeight.w900,
                                        color: widget.theme.hintColor,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          CText(
                                            text: "${widget.list.price}Tshs.",
                                            size: 18,
                                            fontWeight: FontWeight.w900,
                                            color: widget.theme.hintColor.withValues(alpha: .4),
                                          ),
                                          CText(
                                            text: "Discount: ${widget.list.discount}Tshs.",
                                            size: 12,
                                            fontWeight: FontWeight.w500,
                                            color: widget.theme.primaryColor.withValues(alpha: .6),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CText(
                                            text: "Description",
                                            size: 14,
                                            fontWeight: FontWeight.w700,
                                            color: widget.theme.primaryColor.withValues(alpha: 1),
                                          ),
                                          CText(
                                            text: widget.list.description,
                                            size: 13,
                                            color: widget.theme.hintColor.withValues(alpha: 0.6),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CText(
                                                text: "Location",
                                                size: 14,
                                                fontWeight: FontWeight.w700,
                                                color: widget.theme.primaryColor.withValues(alpha: 1),
                                              ),
                                              CText(
                                                text: widget.list.location,
                                                size: 13,
                                                color: widget.theme.hintColor.withValues(alpha: 0.6),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CText(
                                                text: "Category",
                                                size: 14,
                                                fontWeight: FontWeight.w700,
                                                color: widget.theme.primaryColor.withValues(alpha: 1),
                                              ),
                                              CText(
                                                text: widget.list.category,
                                                size: 13,
                                                color: widget.theme.hintColor.withValues(alpha: 0.6),
                                              ),
                                            ],
                                          ),
                                          CBCircle(
                                            border: 50,
                                            theme: widget.theme.canvasColor.withValues(alpha: .4),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: CText(
                                                text: "Product is not Available!",
                                                size: 12,
                                                color: widget.theme.primaryColor.withValues(alpha: .6),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 32.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CText(
                                              text: "More Similar Products",
                                              size: 14,
                                              fontWeight: FontWeight.w700,
                                              color: widget.theme.primaryColor.withValues(alpha: 1),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Row(
                                                  children: [
                                                    for (int i = 0; i < 10; i++) ...[
                                                      Padding(
                                                        padding: const EdgeInsets.only(right: 8.0),
                                                        child: Container(
                                                            clipBehavior: Clip.hardEdge,
                                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: widget.theme.primaryColor.withValues(alpha: .2)),
                                                            child: Image.asset(
                                                              widget.list.path,
                                                              height: 80,
                                                              width: 80,
                                                              fit: BoxFit.cover,
                                                            )),
                                                      ),
                                                    ]
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))
                ],
              ),
              Column(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: Center(
                      child: TouchableOpacity(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, RouteStatics.chat);
                        },
                        child: CBCircle(
                          theme: widget.theme.primaryColor,
                          border: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: CText(
                              text: "Chat with Vendor",
                              color: widget.theme.highlightColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
