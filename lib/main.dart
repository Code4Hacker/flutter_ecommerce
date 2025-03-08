import 'package:ecommerce_app/routes/routes.dart';
import 'package:ecommerce_app/utils/constants/route_statics.dart';
import 'package:ecommerce_app/utils/themes/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeController.lightMode,
      darkTheme: AppThemeController.lightMode,
      initialRoute: RouteStatics.initialRoute,
      onGenerateRoute: NavigatorRouter.generateRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
