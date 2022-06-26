import 'package:dop_app/core/base/state/base_state.dart';
import 'package:flutter/material.dart';

class SplashView extends BaseStateless {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width(context),
        height: height(context),
        decoration: BoxDecoration(color: themeData(context).colorScheme.secondary),
        child: Image.asset('assets/dop_logo.png'),
      ),
    );
  }
}
