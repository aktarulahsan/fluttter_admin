import 'package:flutter/material.dart';

class MainSide {
  String? title;
  IconData? icon;
  int? id;
  List<MainSide>? submenu;

  MainSide({
    this.title,
    this.icon,
    this.id,
    this.submenu,
  });
}

List demoMainSide = [
  MainSide(
      icon: Icons.dashboard_outlined, title: "Dashboard", id: 0, submenu: []),
  MainSide(icon: Icons.rocket_outlined, title: "activity", id: 1, submenu: [
    MainSide(icon: Icons.dashboard_outlined, title: "home", id: 7, submenu: []),
    MainSide(icon: Icons.dashboard_outlined, title: "quiz", id: 8, submenu: []),
    MainSide(icon: Icons.dashboard_outlined, title: "task", id: 9, submenu: []),
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
