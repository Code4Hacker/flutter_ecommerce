import 'package:ecommerce_app/utils/constants/routes_values.dart';
import 'package:flutter/material.dart';

class RouterProvider with ChangeNotifier {
  String _active = RouteValues.home;
  String get active => _active;

  void setActive(String value) {
    _active = value;
    notifyListeners();
  }
}
