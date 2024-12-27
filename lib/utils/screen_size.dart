import 'package:flutter/widgets.dart';

class SizeUtil {
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  // Breakpoints
  static late bool isSmallScreen;
  static late bool isMediumScreen;
  static late bool isLargeScreen;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    // Define breakpoints
    isSmallScreen = screenWidth < 600;
    isMediumScreen = screenWidth >= 600 && screenWidth < 1200;
    isLargeScreen = screenWidth >= 1200;
  }

  static double widthPercentage(double percentage) {
    return blockSizeHorizontal * percentage;
  }

  static double heightPercentage(double percentage) {
    return blockSizeVertical * percentage;
  }

  static double textSize(double size) {
    return blockSizeHorizontal * size;
  }
  
  static double iconSize(double size) {
    return blockSizeHorizontal * size;
  }

  static double spacing(double size) {
    return blockSizeHorizontal * size;
  }

  // Pour gérer les paddings/margins de manière responsive
  static EdgeInsets paddingAll(double value) {
    return EdgeInsets.all(spacing(value));
  }

  static EdgeInsets paddingSymmetric({double horizontal = 0, double vertical = 0}) {
    return EdgeInsets.symmetric(
      horizontal: spacing(horizontal),
      vertical: spacing(vertical),
    );
  }

  // Pour gérer les border radius de manière responsive
  static BorderRadius borderRadius(double radius) {
    return BorderRadius.circular(spacing(radius));
  }

  // Pour adapter les tailles en fonction du type d'écran
  static double adaptiveSize(double mobile, double tablet, double desktop) {
    if (isSmallScreen) return mobile;
    if (isMediumScreen) return tablet;
    return desktop;
  }

  // Pour gérer les contraintes de taille de manière responsive
  static double maxWidth(double percentage) {
    return screenWidth * (percentage / 100);
  }

  static double maxHeight(double percentage) {
    return screenHeight * (percentage / 100);
  }

  // Pour gérer les breakpoints de manière plus précise
  static bool get isPortrait => 
      screenHeight > screenWidth;
      
  static bool get isLandscape => 
      screenWidth > screenHeight;
}
