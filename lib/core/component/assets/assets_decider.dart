import 'package:dop_app/core/constant/enum/app_theme_enum.dart';

class AssetDecide {
  String iconDecider(String iconName, String theme) {
    if (theme == APPTHEME.DARK) {
      return "assets/dark/icons/$iconName.svg";
    } else {
      return "assets/ligth/icons/$iconName.svg";
    }
  }

  String pngDecide(String assetsName, String theme) {
    if (theme == APPTHEME.DARK) {
      return "assets/dark/$assetsName.png";
    } else {
      return "assets/ligth/$assetsName.png";
    }
  }
}
