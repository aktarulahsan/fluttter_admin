import 'package:flutter/material.dart';

class MainSide {
  final String title;
  final IconData icon;
  final int id;
  List<MainSide>? submenu;

  MainSide({
    required this.title,
    required this.icon,
    required this.id,
    this.submenu,
  });
}

List demoMainSide = [
  MainSide(
      icon: Icons.dashboard_outlined, title: "Dashboard", id: 0, submenu: []),
  MainSide(icon: Icons.rocket_outlined, title: "Activity", id: 1, submenu: [
    MainSide(
        icon: Icons.dashboard_outlined, title: "Activity1", id: 7, submenu: []),
    MainSide(
        icon: Icons.dashboard_outlined, title: "Activity2", id: 8, submenu: []),
    MainSide(
        icon: Icons.dashboard_outlined, title: "Activity3", id: 9, submenu: []),
  ]),
  MainSide(
      icon: Icons.fitness_center_outlined,
      title: "Workout",
      id: 2,
      submenu: []),
  MainSide(
      icon: Icons.email_outlined, title: "Chat with coach", id: 3, submenu: []),
  MainSide(icon: Icons.egg_alt_outlined, title: "Diets", id: 4, submenu: []),
];
