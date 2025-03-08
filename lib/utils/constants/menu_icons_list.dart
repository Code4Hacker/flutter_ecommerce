import 'package:ecommerce_app/utils/constants/routes_values.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class Menu {
  static List<MenuModal> menuList = [
    const MenuModal(icon: HugeIcons.strokeRoundedHouse01, title: RouteValues.home),
    const MenuModal(icon: HugeIcons.strokeRoundedComputer, title: RouteValues.discovery),
    const MenuModal(icon: HugeIcons.strokeRoundedMessage01, title: RouteValues.chats),
    const MenuModal(icon: HugeIcons.strokeRoundedSetting06, title: RouteValues.settings),
  ];
}

class MenuModal {
  final IconData icon;
  final String title;

  const MenuModal({required this.icon, required this.title});
}
