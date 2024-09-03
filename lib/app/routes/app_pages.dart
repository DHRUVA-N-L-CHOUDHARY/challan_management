import 'package:challan_management/app/modules/record_listing/views/record_listing_view.dart';
import 'package:challan_management/app/modules/add_record/views/add_record_view.dart';
import 'package:challan_management/app/modules/login/views/login_view.dart';
import 'package:challan_management/app/modules/register/views/register_view.dart';
import 'package:challan_management/app/modules/splash/views/splash_view.dart';
import 'package:challan_management/app/modules/verify_otp/views/verify_otp_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;
  static const SIGNIN = Routes.SIGNIN;
  static const VERIFYOTP = Routes.VERIFYOTP;
  static const SIGNUP = Routes.SIGNUP;
  static const DASHBOARD = Routes.DASHBOARD;
  static const SEARCH = Routes.SEARCH;
  static const CHECKOUT = Routes.CHECKOUT;
  static const SPLASH = Routes.SPLASH;
  static const HOME = Routes.HOME;
  static const ADDRECORD = Routes.ADDRECORD;
  static const RECORDLISTING = Routes.RECORDLISTING;
  static const RECORDDETAIL = Routes.RECORDDETAIL;
  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      // binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const LoginView(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.VERIFYOTP,
      page: () => const VerifyOTPView(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const RegisterView(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ADDRECORD,
      page: () => const AddRecordView(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.RECORDLISTING,
      page: () => const RecordListingView(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.RECORDDETAIL,
      page: () => const RecordListingView(),
      // binding: LoginBinding(),
    ),
  ];
}
