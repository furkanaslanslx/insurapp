import 'package:flutter/material.dart';

class ResponsiveSize {
  double getHeight(BuildContext context, double heightOfDesign) {
    return MediaQuery.of(context).size.height * heightOfDesign / 1334;
  }

  double getWidth(BuildContext context, double widthOfDesign) {
    return MediaQuery.of(context).size.width * widthOfDesign / 750;
  }
}
