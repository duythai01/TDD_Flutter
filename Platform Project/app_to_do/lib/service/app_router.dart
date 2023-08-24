import 'package:app_to_do/screens/recycle_bin.dart';
import 'package:app_to_do/screens/task_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBinScreen.id:
        return MaterialPageRoute(builder: (_) => const RecycleBinScreen());
      case TaskScreen.id:
        return MaterialPageRoute(builder: (_) => const TaskScreen());
      default:
       return null;

    }
  }
}
