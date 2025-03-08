// ignore_for_file: unused_field

import 'dart:io';
import 'dart:ui';

import 'package:ecommerce_app/components/bordered_container.dart';
import 'package:ecommerce_app/components/circle_container.dart';
import 'package:ecommerce_app/components/customer_text.dart';
import 'package:ecommerce_app/models/message_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:lottie/lottie.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final ScrollController _scrollController = ScrollController();

  List<MessageModal> messages = [];
  bool animated = false;
  bool hidenote = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  final FocusNode _textFieldFocusNode = FocusNode();
  TextEditingController userMessage = TextEditingController();
  Future getMessages(text) async {
    setState(() {
      isLoading = true;
    });
    messages.add(MessageModal(message: userMessage.text, response: false));
    userMessage.text = "";
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
    });
    // http.Response respond = await MessageGet.getMessages(text);
    // ApiMessageModal apiMessageModal = apiMessageModalFromJson(respond.body);

    Future.delayed(const Duration(seconds: 2), () {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 1), curve: Curves.fastOutSlowIn);
      });
      // messages.add(MessageModal(
      //     message: apiMessageModal.message,
      //     response: apiMessageModal.response));
      setState(() {
        isLoading = false;
      });
      SchedulerBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        animated = true;
      });
    });
    ThemeData themeData = Theme.of(context);
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: themeData.highlightColor,
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SizedBox(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CCircle(height: mediaQuery.width / 1.5, width: mediaQuery.width / 1.5, theme: Theme.of(context).primaryColor.withValues(alpha: .4)),
                          const Spacer()
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Spacer(),
                          CCircle(height: mediaQuery.width / 3.5, width: mediaQuery.width / 3.5, theme: Colors.orange),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Spacer(),
                          CBCircle(height: mediaQuery.width / 2, width: mediaQuery.width / 2, theme: Colors.amber.withValues(alpha: .4)),
                          const Spacer(),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  color: themeData.highlightColor.withValues(alpha: .6),
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 84.0),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return SingleChildScrollView(
                              controller: _scrollController,
                              child: ConstrainedBox(
                                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                                child: IntrinsicHeight(
                                  child: Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                  SizedBox(
                                    height: (kIsWeb || (!kIsWeb && Platform.isAndroid)) ? 94 : 110,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          for (int index = 0; index < messages.length; index++) ...[
                                            if (messages[index].response == true) ...[
                                              Row(
                                                children: [
                                                  Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
                                                      child: AnimatedContainer(
                                                        duration: const Duration(seconds: 1),
                                                        decoration: BoxDecoration(
                                                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(42), topRight: Radius.circular(24), bottomLeft: Radius.circular(8), bottomRight: Radius.circular(24)),
                                                          gradient: LinearGradient(colors: [
                                                            themeData.primaryColor,
                                                            themeData.secondaryHeaderColor,
                                                          ]),
                                                        ),
                                                        constraints: BoxConstraints(
                                                          maxWidth: mediaQuery.width / 1.4,
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(18.0),
                                                          child: CText(
                                                            text: messages[index].message,
                                                            fontWeight: FontWeight.normal,
                                                          ),
                                                        ),
                                                      )),
                                                  Spacer()
                                                ],
                                              )
                                            ] else ...[
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
                                                child: Row(
                                                  children: [
                                                    const Spacer(),
                                                    Container(
                                                      decoration: BoxDecoration(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(42), bottomLeft: Radius.circular(24), topRight: Radius.circular(8), topLeft: Radius.circular(24)), color: themeData.primaryColor.withValues(alpha: 0.43)),
                                                      constraints: BoxConstraints(
                                                        maxWidth: mediaQuery.width / 1.4,
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18),
                                                        child: CText(
                                                          text: messages[index].message,
                                                          fontWeight: FontWeight.normal,
                                                          size: 13,
                                                          color: themeData.highlightColor,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ],
                                          if (isLoading == true) ...[
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Lottie.asset(
                                                    "assets/loading.json",
                                                    width: 60,
                                                    height: 60,
                                                  ),
                                                  const Spacer()
                                                ],
                                              ),
                                            )
                                          ] else ...[
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: CBCircle(
                                                      border: 12,
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: CText(
                                                          text: "hello, How can I help you?",
                                                          color: themeData.hintColor.withValues(alpha: .8),
                                                          size: 13,
                                                        ),
                                                      )),
                                                ),
                                              ],
                                            )
                                          ],
                                          const Spacer()
                                        ],
                                      ),
                                    ),
                                  )
                                                                      ],
                                                                    ),
                                ),
                              ),
                            );
                          },
                        ),
                      )),
                ),
                Column(
                  children: [
                    const Spacer(),
                    Container(
                      width: mediaQuery.width,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(color: themeData.primaryColor.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(0)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Divider(
                                color: themeData.hoverColor.withValues(alpha: 0.2),
                                height: .5,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 500),
                                      decoration: BoxDecoration(color: themeData.hoverColor, borderRadius: BorderRadius.circular(50), border: Border.all(color: userMessage.text.isNotEmpty ? themeData.secondaryHeaderColor : themeData.focusColor, width: 1)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                          child: Stack(
                                            alignment: Alignment.centerRight,
                                            children: [
                                              SizedBox(
                                                width: mediaQuery.width,
                                                child: TextFormField(controller: userMessage, cursorColor: themeData.primaryColor, style: GoogleFonts.karla(textStyle: TextStyle(fontSize: 14, color: themeData.highlightColor.withValues(alpha: 0.8))), decoration: InputDecoration(border: InputBorder.none, hintText: "Send Message...", hintStyle: GoogleFonts.dmSans(textStyle: TextStyle(fontSize: 13, color: themeData.highlightColor)))),
                                              ),
                                              TouchableOpacity(
                                                onTap: () async {
                                                  final String text = userMessage.text;
                                                  setState(() {
                                                    if (userMessage.text.isNotEmpty) {
                                                      getMessages(text);
                                                    }
                                                  });
                                                },
                                                child: AnimatedContainer(
                                                  duration: const Duration(milliseconds: 500),
                                                  height: 42,
                                                  width: 42,
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: userMessage.text.isNotEmpty ? themeData.secondaryHeaderColor : themeData.focusColor),
                                                  child: Icon(CupertinoIcons.paperplane_fill, color: themeData.hintColor, size: 18),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      width: double.infinity,
                      decoration: BoxDecoration(color: themeData.highlightColor.withValues(alpha: .4)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 32, sigmaY: 32),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: (kIsWeb || (!kIsWeb && Platform.isAndroid)) ? 54 : 70,
                            ),
                            TouchableOpacity(
                              onTap: () => Navigator.pop(context),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft02, color: themeData.hintColor),
                                    CText(text: "Message Identity", fontWeight: FontWeight.w300,
                                    color: themeData.hintColor.withValues(alpha: .4),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      height: 0,
                    ),
                    const Spacer()
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class SwipperWidget extends StatelessWidget {
  const SwipperWidget({super.key, required this.mediaQuery, required this.index, required this.current});

  final Size mediaQuery;
  final int index;
  final int current;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: AnimatedContainer(width: current == index ? (mediaQuery.width / 10) : (mediaQuery.width / 6), height: 2, decoration: BoxDecoration(color: current == index ? Theme.of(context).primaryColor : Theme.of(context).focusColor, borderRadius: BorderRadius.circular(50)), duration: const Duration(milliseconds: 500)),
    );
  }
}
