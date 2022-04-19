import 'package:flutter/material.dart';
import 'package:login/widget/authen.dart';
import 'package:login/widget/home.dart';

final Map<String, WidgetBuilder> routes = {
  '/authen': (BuildContext context) => Authen(),
  '/home': (BuildContext context) => Home(),
};

