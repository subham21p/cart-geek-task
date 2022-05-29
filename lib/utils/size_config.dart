import 'package:flutter/widgets.dart';

class SizeConfig {
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVerticle;

  static double? textMultiplier;
  static double? imageSizeMultiplier;
  static double? heightMultiplier;
  static double? widthMultiplier;
  static double? fullHeight;
  static double? fullWidth;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      screenHeight = constraints.maxHeight;
      screenWidth = constraints.maxWidth;
    } else {
      screenHeight = constraints.maxWidth;
      screenWidth = constraints.maxHeight;
    }
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVerticle = screenHeight! / 100;

    textMultiplier = blockSizeVerticle;
    imageSizeMultiplier = blockSizeHorizontal;
    heightMultiplier = (blockSizeVerticle! / 10);
    widthMultiplier = (blockSizeHorizontal! / 10);
    fullHeight = screenHeight!;
    fullWidth = screenWidth!;
  }
}
