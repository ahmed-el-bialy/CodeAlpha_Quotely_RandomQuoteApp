import 'package:flutter/material.dart';
import 'package:quotely/core/constants/app_constants.dart';
import 'package:quotely/features/home/ui/home_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case AppConstants.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
