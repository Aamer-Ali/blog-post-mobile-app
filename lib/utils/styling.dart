import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTheme {
  AppTheme._();

  static const Color colorWhite = Color(0xFFFFFFFF);
  static const Color colorBlack = Color(0xFF000000);
  static const Color appBarColor = Color(0xFFB1ACAC);
  static const Color bottomBarColor = Color(0xFFB1ACAC);



  static final ThemeData lightThemeData = ThemeData(
    appBarTheme: lightAppBarTheme,
    scaffoldBackgroundColor: AppTheme.colorWhite,
    brightness: Brightness.light,
    textTheme: lightTextTheme,
  );

  static const AppBarTheme darkAppBarTheme = AppBarTheme(
    color: AppTheme.colorBlack,
    titleTextStyle: TextStyle(color: AppTheme.colorWhite),
  );

  static const AppBarTheme lightAppBarTheme = AppBarTheme(
    color: AppTheme.appBarColor,
    titleTextStyle: TextStyle(color: AppTheme.colorBlack),
  );

  static final ThemeData darkThemeData = ThemeData(
    appBarTheme: darkAppBarTheme,
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    textTheme: darkTextTheme,
  );

  static final TextTheme lightTextTheme = TextTheme(
    headline6: _titleLight,
    subtitle2: _subTitleLight,
    button: _buttonLight,
  );

  static final TextTheme darkTextTheme = TextTheme(
    headline6: _titleDark,
    subtitle2: _subTitleDark,
    button: _buttonDark,
  );

  static final ButtonStyle alertDangerButton = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
      textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(fontSize: 1.5 * Get.height)));

  static final TextStyle _titleLight = TextStyle(
    color: Colors.black,
    fontSize: 2.3 * Get.height,
  );

  static final TextStyle _subTitleLight = TextStyle(
    color: Colors.black,
    fontSize: 1.5 * Get.height,
    height: 1.5,
  );

  static const TextStyle _buttonLight = TextStyle(
    color: Colors.black,
    fontSize: 15,
  );

  static final TextStyle _titleDark = _titleLight.copyWith(color: Colors.white);
  static final TextStyle _subTitleDark =
      _subTitleLight.copyWith(color: Colors.white);
  static final TextStyle _buttonDark =
      _buttonLight.copyWith(color: Colors.white);


  static const TextStyle errorTextTheme = TextStyle(
    color: Colors.grey,
    fontSize: 20,
  );
}
