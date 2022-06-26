import 'package:dop_app/core/init/memory/hive_manager.dart';
import 'package:dop_app/core/init/notifier/provider_list.dart';
import 'package:dop_app/core/init/notifier/theme_notifier.dart';
import 'package:dop_app/core/init/services/data_request.dart';
import 'package:dop_app/ui/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveManager.instance.hiveInit();
  await GetDataFromApi().setStateNames();
  FlutterNativeSplash.removeAfter(initialization);

  runApp(MultiProvider(providers: [...ApplicationProvider.instance.dependItems], child: MyApp()));
}

Future initialization(BuildContext? context) async {
  await Future.delayed(Duration(seconds: 1));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: Provider.of<ThemeNotifier>(context, listen: true).currentTheme,
      home: HomeView(),
    );
  }
}
