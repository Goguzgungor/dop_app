import 'package:dop_app/core/constant/enum/app_theme_enum.dart';
import 'package:dop_app/core/init/memory/hive_boxes.dart';
import 'package:dop_app/core/init/memory/hive_manager.dart';
import 'package:dop_app/core/init/notifier/theme_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'homeview_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  @observable
  String theme = APPTHEME.LIGTH;
  @observable
  ObservableList stateList = ObservableList.of([]);
  @action
  void getData() {
    List temp = HiveManager.instance.getListFromBox(HiveBoxes.STATE);
    if (temp.isNotEmpty) stateList = ObservableList.of(temp);
  }

  @action
  void changeTheme(BuildContext context) {
    if (theme == APPTHEME.LIGTH) {
      Provider.of<ThemeNotifier>(context, listen: false).changeAppTheme(AppThemes.DARK);
      theme = APPTHEME.DARK;
    } else if (theme == APPTHEME.DARK) {
      Provider.of<ThemeNotifier>(context, listen: false).changeAppTheme(AppThemes.LIGHT);
      theme = APPTHEME.LIGTH;
    }
  }

  @action
  void searrchFonc(String searchtext) {
    if (searchtext != '') {
      getData();
      List temp = stateList.where((text) {
        dynamic newtext = text.toLowerCase();
        return newtext.contains(searchtext.toLowerCase());
      }).toList();
      stateList = ObservableList.of(temp);
    } else {
      getData();
    }
  }
}
