import 'package:challan_management/app/data/local/my_shared_pref.dart';
import 'package:challan_management/config/theme/dark_theme_colors.dart';
import 'package:challan_management/config/theme/light_theme_colors.dart';
import 'package:get/get.dart';

class RecordDetailController extends GetxController{
  var primaryColor = MySharedPref.getThemeIsLight() ? LightThemeColors.kPrimaryColor : DarkThemeColors.kPrimaryColor;
  var secondaryColor = MySharedPref.getThemeIsLight() ? LightThemeColors.kSecondaryColor : DarkThemeColors.kSecondaryColor;
}