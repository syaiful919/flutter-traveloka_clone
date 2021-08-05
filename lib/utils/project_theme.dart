import 'dart:ui';

import 'package:flutter/material.dart';

class ProjectColor {
  static const Color blue = Color(0xff0194F3);
  static const Color darkBlue = Color(0xff235d9f);
  static const Color red = Color(0xffec3a3e);
  static const Color green = Color(0xff20bf55);
  static const Color darkGreen = Color(0xff087e8b);
  static const Color yellow = Color(0xffFFC700);
  static const Color orange = Color(0xfffca000);
  static const Color salmon = Color(0xffff6d6a);

  static const Color whiteOrigin = Colors.white;
  static const Color whiteBackground = Color(0xffFAFAFC);

  static const Color blackOrigin = Colors.black;
  static const Color blackText = Color(0xff03121a);

  static const Color greyText = Color(0xff687176);
  static const Color greyDivider = Color(0xffd8d8d8);
  static const Color greyDisabled = Color(0xffbdbdbd);
}

class Gap {
  static const double zero = 0;
  static const double xxs = 4;
  static const double xs = 6;
  static const double s = 12;
  static const double m = 16;
  static const double l = 20;
  static const double xl = 24;
}

class TypoSize {
  static const double header1 = 22;
  static const double header2 = 20;
  static const double header3 = 18;
  static const double title = 16;
  static const double main = 14;
  static const double secondary = 13;
  static const double small = 10;
}

class TypoStyle {
  static const titleBlack600 = TextStyle(
    fontSize: TypoSize.title,
    color: ProjectColor.blackText,
    fontWeight: FontWeight.w600,
  );

  static const titleWhite = TextStyle(
    fontSize: TypoSize.title,
    color: ProjectColor.whiteOrigin,
  );

  static const mainOrange = TextStyle(
    fontSize: TypoSize.main,
    color: ProjectColor.orange,
  );

  static const mainBlack = TextStyle(
    fontSize: TypoSize.main,
    color: ProjectColor.blackText,
  );

  static const mainBlack600 = TextStyle(
    fontSize: TypoSize.main,
    color: ProjectColor.blackText,
    fontWeight: FontWeight.w600,
  );

  static const mainWhite600 = TextStyle(
    fontSize: TypoSize.main,
    color: ProjectColor.whiteOrigin,
    fontWeight: FontWeight.w600,
  );

  static const mainGrey = TextStyle(
    fontSize: TypoSize.main,
    color: ProjectColor.greyText,
  );

  static const mainBlue600 = TextStyle(
    fontSize: TypoSize.main,
    color: ProjectColor.blue,
    fontWeight: FontWeight.w600,
  );

  static const smallBlack = TextStyle(
    fontSize: TypoSize.small,
    color: ProjectColor.blackText,
  );

  static const smallBlack600 = TextStyle(
    fontSize: TypoSize.small,
    color: ProjectColor.blackText,
    fontWeight: FontWeight.w600,
  );

  static const smallGrey = TextStyle(
    fontSize: TypoSize.small,
    color: ProjectColor.greyText,
  );

  static const smallGrey600 = TextStyle(
    fontSize: TypoSize.small,
    color: ProjectColor.greyText,
    fontWeight: FontWeight.w600,
  );
}

class IconSize {
  static const double xs = 12;
  static const double s = 16;
  static const double m = 24;
  static const double l = 32;
}

class RadiusSize {
  static const double xs = 2;
  static const double s = 4;
  static const double m = 8;
  static const double l = 10;
  static const double xl = 16;
  static const double xxl = 20;
}

ThemeData projectTheme = ThemeData(
  primaryColor: ProjectColor.blue,
  backgroundColor: ProjectColor.whiteOrigin,
  scaffoldBackgroundColor: ProjectColor.whiteBackground,
  iconTheme: IconThemeData(
    color: ProjectColor.blue,
    size: IconSize.m,
  ),
  hintColor: ProjectColor.greyText,
  errorColor: ProjectColor.red,
  disabledColor: ProjectColor.greyDisabled,
  dividerTheme: DividerThemeData(color: ProjectColor.greyDivider, thickness: 1),
);
