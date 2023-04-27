import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/main_layout/main_layout.dart';
import 'package:rick_and_morty/presentation/onBoarding/onBoadring_view.dart';
import 'package:rick_and_morty/presentation/search_view/search_view.dart';
import 'package:rick_and_morty/presentation/splash/splash_view.dart';
import 'package:rick_and_morty/presentation/undifined/undefined_route.dart';

class Routes{
  static const String splashRoute="/";
  static const String onBoardingRoute="/onBoarding";
  static const String mainLayoutRoute="/main_layout";
  static const String undefinedRoute="/undefined";
  static const String searchRoute="/search_view";

}

class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_)=> const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_)=> OnBoardingView());
      case Routes.mainLayoutRoute:
        return MaterialPageRoute(builder: (_)=> const MainLayout());
      case Routes.searchRoute:
        return MaterialPageRoute(builder: (_)=> const SearchView());
    }
    return MaterialPageRoute(builder: (_)=> const UndefinedView());
  }
}