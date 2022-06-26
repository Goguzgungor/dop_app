import 'package:dop_app/core/init/theme/app_theme_datas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AppTheme {
  static AppTheme? _instance;
  static AppTheme get instance {
    _instance ??= AppTheme._init();
    return _instance!;
  }

  AppTheme._init();

  ThemeData theme() {
    if (SchedulerBinding.instance!.window.platformBrightness == Brightness.dark) {
      return AppThemeDatas().darkTheme;
    } else {
      return AppThemeDatas().lightTheme;
    }
  }
}
