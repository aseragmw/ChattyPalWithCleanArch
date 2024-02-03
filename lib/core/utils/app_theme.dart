

import 'dart:ui';

import 'package:ChattyPal/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

class AppTheme {
  //Colors
  static const Color primaryBlueColor = Color(0xff377DFF);
  static const Color blackColor = Color(0xff243443);
  static const Color greyOneColor = Color(0xff58616A);
  static const Color greyTwoColor = Color(0xffAAB0B7);
  //Font Sizes
  static double fontSize12(BuildContext context) =>
      12 * context.screenAspectRatio * 0.5;
  static double fontSize14(BuildContext context) =>
      14 * context.screenAspectRatio * 0.5;
  static double fontSize16(BuildContext context) =>
      16 * context.screenAspectRatio * 0.5;
  static double fontSize18(BuildContext context) =>
      18 * context.screenAspectRatio * 0.5;
  static double fontSize40(BuildContext context) =>
      40 * context.screenAspectRatio * 0.5;
  static double fontSize60(BuildContext context) =>
      60 * context.screenAspectRatio * 0.5;
  static double fontSize80(BuildContext context) =>
      80 * context.screenAspectRatio * 0.5;
  //Font Weights
  static const FontWeight fontWeight400 = FontWeight.w400;
  static const FontWeight fontWeight500 = FontWeight.w500;
  static const FontWeight fontWeight600 = FontWeight.w600;
  static const FontWeight fontWeight700 = FontWeight.w700;
  //Others
  static const BorderRadius boxRadius = BorderRadius.all(Radius.circular(10));
}
