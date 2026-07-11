import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotely/core/constants/app_constants.dart';
import 'package:quotely/features/home/data/repo/home_repo.dart';
import 'package:quotely/features/home/data/webservices/webservices.dart';
import 'package:quotely/features/home/logic/quote_cubit.dart';
import 'package:quotely/features/home/ui/home_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case AppConstants.homeScreen:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) =>
                  QuoteCubit(HomeRepo(webServices: Webservices(Dio()))),
              child: HomeScreen(),
            ));
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
