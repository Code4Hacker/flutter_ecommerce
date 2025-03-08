import 'dart:ui';
import 'package:ecommerce_app/components/customer_text.dart';
import 'package:ecommerce_app/providers/routers/routerchange.dart';
import 'package:ecommerce_app/screens/client_screens/subscreens/chatlist.dart';
import 'package:ecommerce_app/screens/client_screens/subscreens/dicovery_page.dart';
import 'package:ecommerce_app/screens/client_screens/subscreens/home_page.dart';
import 'package:ecommerce_app/utils/constants/menu_icons_list.dart';
import 'package:ecommerce_app/utils/constants/routes_values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final active = context.watch<RouterProvider>();
    return Scaffold(
      backgroundColor: theme.highlightColor,
      body: Stack(
        children: [
          // BackGroundBalls(theme: theme),
          Container(
            decoration: BoxDecoration(color: theme.highlightColor.withValues(alpha: 0.4)),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 32, sigmaY: 32),
                child: Builder(
                  builder: (context) {
                    switch (active.active) {
                      case RouteValues.home:
                        return HomePage(theme: theme);
                      case RouteValues.discovery:
                        return DiscoveryPage(theme: theme);
                      case RouteValues.chats:
                        return ChatListScreen(theme: theme);
                      default:
                        return const Text("");
                    }
                  },
                )),
          ),
          Column(
            children: [
              const Spacer(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(350),
                      color: theme.highlightColor.withValues(alpha: 0.6),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (int i = 0; i < Menu.menuList.length; i++) ...[
                            Padding(
                              padding: EdgeInsets.only(right: i == Menu.menuList.length ? 0 : 4, left: i == 0 ? 8 : 0),
                              child: TouchableOpacity(
                                onTap: () => setState(() {
                                  active.setActive(Menu.menuList[i].title);
                                }),
                                child: AnimatedContainer(
                                  duration: Durations.short1,
                                  decoration: BoxDecoration(color: active.active == Menu.menuList[i].title.toLowerCase() ? theme.hintColor : Colors.transparent, borderRadius: BorderRadius.circular(50)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Menu.menuList[i].icon,
                                          color: active.active == Menu.menuList[i].title.toLowerCase() ? theme.highlightColor : theme.hintColor,
                                          size: 18,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 2),
                                          child: CText(
                                            text: Menu.menuList[i].title.toUpperCase(),
                                            color: active.active == Menu.menuList[i].title.toLowerCase() ? theme.highlightColor : theme.hintColor,
                                            fontWeight: FontWeight.w600,
                                            size: 10,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ]
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
