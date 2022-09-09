import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/presentation/screens/search_screen.dart';

import '../screens/home_screen.dart';
import '../screens/splash_screen.dart';
import 'app_router_names.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterNames.rSplashRoute:
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case AppRouterNames.rHomeRoute:
        return MaterialPageRoute(builder: (context) =>  HomeScreen());
      case AppRouterNames.rSearchRoute:
        return MaterialPageRoute(builder: (context) => SearchScreen());
    }
  }
}
