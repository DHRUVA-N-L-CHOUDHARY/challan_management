// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref {
  // prevent making instance
  MySharedPref._();

  // get storage
  static late SharedPreferences _sharedPreferences;

  // STORING KEYS
  static const _lightThemeKey = "is_theme_light";
  static const _userId = "userId";
  static const _phoneNumber = "+91 9000000001";
  static const _userName = "John Doe";
  static const _token = "token";

  /// init get storage services
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /// set theme current type as light theme
  static void setThemeIsLight(bool lightTheme) =>
      _sharedPreferences.setBool(_lightThemeKey, lightTheme);

  /// get if the current theme type is light
  static bool getThemeIsLight() =>
      _sharedPreferences.getBool(_lightThemeKey) ?? true;

  /// set theme current userID 
  static void setUserId(String userId) =>
      _sharedPreferences.setString(_userId, userId);

  /// get if the current userID 
  static String getUserId() =>
      _sharedPreferences.getString(_userId) ?? "";

  /// set theme current phoneNumber 
  static void setPhoneNumber(String phoneNumber) =>
      _sharedPreferences.setString(_phoneNumber, phoneNumber);

  /// get if the current phoneNumber
  static String getPhoneNumber() =>
      _sharedPreferences.getString(_phoneNumber) ?? "";

  /// set theme current userName 
  static void setUserName(String userName) =>
      _sharedPreferences.setString(_userName, userName);

  /// get if the current userName
  static String getUserName() =>
      _sharedPreferences.getString(_userName) ?? "";

  /// set theme current userName 
  static void setToken(String token) =>
      _sharedPreferences.setString(_token, token);

  /// get if the current userName
  static String getToken() =>
      _sharedPreferences.getString(_token) ?? "";

  static void clearSession() {
    _sharedPreferences.clear();
  }
}
