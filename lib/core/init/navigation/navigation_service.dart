import 'package:dop_app/core/init/navigation/base_navigation_service.dart';
import 'package:flutter/material.dart';

class NavigationService implements BaseNavigationService {
  static NavigationService? _instance;
  static NavigationService get instance {
    _instance ??= NavigationService._init();
    return _instance!;
  }

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  removeOldRoutes() => (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage({required String path, Object? arguments}) async {
    await navigatorKey.currentState!.pushNamed(path, arguments: arguments);
  }

  @override
  Future<void> navigateToPageReplacement({required String path, Object? arguments}) async {
    await navigatorKey.currentState!.pushReplacementNamed(path, arguments: arguments);
  }

  @override
  Future<void> navigateToPageClear({required String path, Object? object}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(path, removeOldRoutes(), arguments: object);
  }
}
