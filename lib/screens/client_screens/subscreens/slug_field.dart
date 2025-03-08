import 'package:ecommerce_app/components/bordered_container.dart';
import 'package:ecommerce_app/components/circle_container.dart';
import 'package:ecommerce_app/components/customer_text.dart';
import 'package:ecommerce_app/screens/client_screens/subscreens/single_item.dart';
import 'package:ecommerce_app/utils/constants/sample_array_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class SlugField extends StatefulWidget {
  const SlugField({
    super.key,
    required this.theme,
    required this.list,
  });

  final ThemeData theme;
  final ImageModal list;

  @override
  State<SlugField> createState() => _SlugFieldState();
}

class _SlugFieldState extends State<SlugField> {
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
                    childCount: 9,
                    addAutomaticKeepAlives: false,
                    addRepaintBoundaries: false,
                    (context, index) => Skeletonizer(
                      enabled: _enabled,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12, top: 24),
                        child: TouchableOpacity(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SingleSlug(theme: widget.theme, list: widget.list),
                                ));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Container(
                                        clipBehavior: Clip.hardEdge,
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                                        child: Image.asset(
                                          widget.list.path,
                                          height: 60,
                                          width: 60,
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CText(
                                          text: "${widget.list.title}",
                                          size: 20,
                                          fontWeight: FontWeight.w900,
                                          color: widget.theme.hintColor,
                                        ),
                                        CText(
                                          text: widget.list.description.length > 90 ? "${widget.list.description.substring(0, 90)}..." : widget.list.description,
                                          size: 13,
                                          color: widget.theme.hintColor.withValues(alpha: 0.6),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Divider(color: widget.theme.hintColor.withValues(alpha: 0.1)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ))
                ],
              ),
              // Column(
              //   children: [
              //     const Spacer(),
              //     Padding(
              //       padding: const EdgeInsets.only(bottom: 32.0),
              //       child: Center(
              //         child: CBCircle(
              //           theme: widget.theme.primaryColor,
              //           border: 50,
              //           child: Padding(
              //             padding: const EdgeInsets.all(12.0),
              //             child: CText(
              //               text: "Chat with Vendor",
              //               color: widget.theme.highlightColor,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // )
            ],
          )),
    );
  }
}
