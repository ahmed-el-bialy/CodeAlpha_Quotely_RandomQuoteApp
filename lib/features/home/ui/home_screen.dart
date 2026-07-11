import 'package:flutter/material.dart';
import 'package:quotely/core/constants/app_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.appName),
        centerTitle: true,
      ),
    );
  }
}
