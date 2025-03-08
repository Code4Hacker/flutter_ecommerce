import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class Filter {
  static const List<FilterModal> filterList = [
    FilterModal(icon: HugeIcons.strokeRoundedFilterHorizontal, title: "All Locations"),
    FilterModal(icon: HugeIcons.strokeRoundedFilterHorizontal, title: "Dodoma"),
    FilterModal(icon: HugeIcons.strokeRoundedFilterHorizontal, title: "Dar es Salaam"),
    FilterModal(icon: HugeIcons.strokeRoundedFilterHorizontal, title: "Arusha"),
  ];
}

class FilterModal {
  final IconData icon;
  final String title;

  const FilterModal({required this.icon, required this.title});
}
