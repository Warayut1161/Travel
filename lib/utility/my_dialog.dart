import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:login/utility/my_style.dart';

// หน้าต่างของการที่เราปิด service Location อยู่
class MyDialog {
  Future<Null> alertLocationService(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: MyStyle().showLogo(),
          title: ShowTitle(
            title: title,
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: MyStyle().darkColor,
            ),
          ),
          subtitle: ShowTitle(
            title: message,
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: MyStyle().darkColor,
            ),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () async {
                Navigator.pop(context);
                await Geolocator.openLocationSettings();
                exit(0);
              },
              child: Text('OK'))
        ],
      ),
    );
  }
}
