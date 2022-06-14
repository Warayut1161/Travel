import 'package:flutter/material.dart';
import 'package:login/widget/authen.dart';
import 'package:login/widget/editcomment.dart';
import 'package:login/widget/editprofile.dart';
import 'package:login/widget/home.dart';

final Map<String, WidgetBuilder> routes = {
  
  '/authen': (BuildContext context) => Authen(),
  '/home': (BuildContext context) => Home(),
  '/editprofile': (BuildContext context) => EditPF(),
  // '/homeshop': (BuildContext context) => HomeShop(),
  '/editcomment': (BuildContext context) => ShowEditReview(),
};
