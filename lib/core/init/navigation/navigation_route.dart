import 'dart:io' show Platform;
import 'package:dop_app/core/constant/navigation/navigation_constants.dart';
import 'package:dop_app/ui/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationRoute {
  static NavigationRoute? _instance;
  static NavigationRoute get instance {
    _instance ??= NavigationRoute._init();
    return _instance!;
  }

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.HOME_VIEW:
        return normalNavigate(HomeView());

      default:
        return normalNavigate(const HomeView());
    }
  }

  PageRoute normalNavigate(Widget widget) {
    return Platform.isAndroid ? MaterialPageRoute(builder: (context) => widget) : CupertinoPageRoute(builder: (context) => widget);
  }

  PageRoute normalNavigateToPop(Widget widget) {
    return Platform.isAndroid ? MaterialPageRoute(builder: (context) => widget) : CupertinoPageRoute(builder: (context) => widget, fullscreenDialog: true);
  }
}
