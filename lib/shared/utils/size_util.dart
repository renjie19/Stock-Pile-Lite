import 'package:flutter/material.dart';

class SizeUtil {
  static double getHeightFromTotalAvailable(BuildContext context, double heightPercentage) {
    return (MediaQuery.of(context).size.height / 100) *  heightPercentage;
  }

  static double getWidthFromTotalAvailable(BuildContext context, double widthPercentage) {
    return (MediaQuery.of(context).size.width / 100) *  widthPercentage;
  }
}