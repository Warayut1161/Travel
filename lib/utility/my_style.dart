import 'package:flutter/material.dart';

class ShowTitle extends StatelessWidget {
  final String title;
  final TextStyle textStyle;
  const ShowTitle({Key? key, required this.title, required this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyStyle {
  Color darkColor = Color(0xff0069c0);
  Color primaryColor = Color(0xff2196f3);
  Color lightColor = Color(0xff6ec6ff);
  Color Plamcolor = Color(0xff00b686);
  Widget showLogo() => Image.asset('images/logo.png');

  Widget titleH1(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: darkColor,
        ),
      );

  Widget titleH2(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: darkColor,
        ),
      );

  Widget titleH3(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 16,
          //fontWeight: FontWeight.bold,
          color: darkColor,
        ),
      );

  Widget titleH4(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );

  Widget titleH5(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
  SizedBox mySizebox() => SizedBox(
        width: 8.0,
        height: 16.0,
      );

  MyStyle();
}
