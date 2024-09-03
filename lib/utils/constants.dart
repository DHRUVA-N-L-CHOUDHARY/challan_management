import 'package:challan_management/app/data/local/my_shared_pref.dart';

class ThemeIcons{
  static String get darkTheme => 'assets/icons/dark';
  static String get lightTheme => 'assets/icons/light';
}
class AppImages{
  static String get kAppIconNamed => '/app_icon_named.png';
  static String get kAppIconUnnamed => '/app_icon_unnamed.png';
  static String get kMenuBar => '/menubar.png';
}
String appConst = MySharedPref.getThemeIsLight() ? ThemeIcons.lightTheme : ThemeIcons.darkTheme; 