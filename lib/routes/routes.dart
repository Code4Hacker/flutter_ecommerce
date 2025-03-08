import 'package:ecommerce_app/screens/client_screens/home_screen.dart';
import 'package:ecommerce_app/screens/client_screens/subscreens/chatscreen.dart';
import 'package:ecommerce_app/utils/constants/route_statics.dart';
import 'package:flutter/material.dart';

class NavigatorRouter {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteStatics.initialRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RouteStatics.chat:
        return MaterialPageRoute(builder: (context) => ChatBotScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
