import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

Color lightColor = const Color(0xFF57BEC5);
const Color textColor = Color(0xFFFFFFFF);
const Color policiesColor = Color(0xFFCBE2FB);
final ZoomDrawerController innerDrawerController = ZoomDrawerController();
final ZoomDrawerController outerDrawerController = ZoomDrawerController();
final double bottomPadding = WidgetsBinding.instance.platformDispatcher.views.first.viewPadding.bottom;
final double navigationHeight = bottomPadding > 0 ? 80.0 : 50.0;
