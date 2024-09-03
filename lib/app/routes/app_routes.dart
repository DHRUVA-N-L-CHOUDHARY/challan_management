part of 'app_pages.dart';

class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const SIGNIN = _Paths.SIGNIN;
  static const VERIFYOTP = _Paths.VERIFYOTP;
  static const SIGNUP = _Paths.SIGNUP;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const SEARCH = _Paths.SEARCH;
  static const CHECKOUT = _Paths.CHECKOUT;
  static const HOME = _Paths.HOME;
  static const ADDRECORD = _Paths.ADDRECORD;
  static const RECORDLISTING = _Paths.RECORDLISTING;
  static const RECORDDETAIL = _Paths.RECORDDETAIL;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const SIGNIN = '/signin';
  static const VERIFYOTP = '/verifyotp';
  static const SIGNUP = '/signup';
  static const DASHBOARD = '/dashboard';
  static const SEARCH = "/search";
  static const CHECKOUT = "/checkout";
  static const ADDRECORD = "/addrecord";
  static const RECORDLISTING = "/recordlisting";
  static const RECORDDETAIL = "/recorddetail";
  static const HOME = "/home";
}
