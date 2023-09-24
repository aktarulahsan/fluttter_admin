import 'package:flutter/material.dart';

class MainSideSetting {
  final String title;
  final IconData icon;
  final int index;

  MainSideSetting({
    required this.title,
    required this.icon,
    required this.index,
  });
}

List demoMainSideSetting = [
  MainSideSetting(icon: Icons.settings, title: "Settings", index: 5),
  MainSideSetting(icon: Icons.logout_outlined, title: "Log out", index: 6),
];
