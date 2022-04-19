import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login/main.dart';
import 'package:login/model/user_member.dart';
import 'package:login/utility/my_style.dart';
import 'package:login/utility/normal_dialog.dart';
import 'package:login/widget/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  double screen = 1;
  bool statusRedEye = true;
  //String name = 'User', name1 = 'password';
  //Field
  String? user, password, username;
  String? memberUsername;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    print('screen = $screen');
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
              radius: 0.7, colors: <Color>[Colors.white, MyStyle().Plamcolor]),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildLogo(),
                MyStyle().titleH1('Location recommendation'),
                MyStyle().titleH1('system in Chonburi province'),
                buildUser(),
                buildPassword(),
                buildLogin(),
                //buildLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLogin() => Container(
        width: 250.0,
        child: RaisedButton(
          color: MyStyle().darkColor,
          onPressed: () {
            if (user == null ||
                user!.isEmpty ||
                password == null ||
                password!.isEmpty) {
              normalDialog(context, 'กรุณากรอกข้อมูลให้ครบ');
            } else {
              checkAuthen();
            }
          },
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
  Future<Null> checkAuthen() async {
    String url =
        'https://travel1997zz.000webhostapp.com/API2/getUserWhereUser.php?isAdd=true&email=$user&password=$password';
    try {
      Response response = await Dio().get(url);
      print('res = $response');

      var result = json.decode(response.data);
      print('result = $result');

      for (var map in result) {
        UserModel userModel = UserModel.fromJson(map);

        print(userModel.memberPassword);
        if (password == userModel.memberPassword) {
          String? statusUser = userModel.statusUser;
          if (statusUser == '1') {
            routeTuService(Home(), userModel);
          } else if (statusUser == '2') {
            routeTuService(Home(), userModel);
          } else if (statusUser == '3') {
            routeTuService(Home(), userModel);
          } else if (statusUser == '4') {
            routeTuService(Home(), userModel);
          } else {
            normalDialog(context, 'กรุณาลองใหม่');
          }
        } else {
          normalDialog(context, 'password ผิด');
        }
      }
    } catch (e) {}
  }

  Future<Null> routeTuService(Widget myWidget, UserModel userModel) async {
    SharedPreferences? preferences = await SharedPreferences.getInstance();
    preferences.setString('memberId', userModel.memberId.toString());
    preferences.setString(
        'memberUsername', userModel.memberUsername.toString());
    preferences.setString('statusUser', userModel.statusUser.toString());
    preferences.setString('memberName', userModel.memberName.toString());
    preferences.setString('profilePer', userModel.profilePer.toString());

    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => myWidget,
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

/* Container buildLogin() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.75,
      child: ElevatedButton(
        onPressed: () {
          if (user == null ||
              user.isEmpty ||
              password == null ||
              password.isEmpty) {
            normalDialog(context, 'มีช่องว่าง กรูณากรอกให้ครบ');
          } else {
            debugCheckHasWidgetsLocalizations(context);
          }
        },
        child: Text('Login'),
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
    
  }*/

  Container buildUser() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white70),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => user = value.trim(),
        decoration: InputDecoration(
          hintText: 'User:',
          prefixIcon: Icon(Icons.perm_identity),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: MyStyle().darkColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: MyStyle().lightColor),
          ),
        ),
      ),
    );
  }

  Container buildPassword() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white70),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => password = value.trim(),
        obscureText: statusRedEye,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              icon: statusRedEye
                  ? Icon(Icons.remove_red_eye)
                  : Icon(Icons.remove_red_eye_outlined),
              onPressed: () {
                setState(() {
                  statusRedEye = !statusRedEye;
                });
                print('statusRedEye = $statusRedEye');
              }),
          hintText: 'Password:',
          prefixIcon: Icon(Icons.lock_outline),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: MyStyle().darkColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: MyStyle().lightColor),
          ),
        ),
      ),
    );
  }

  Container buildLogo() {
    return Container(
      width: screen * 0.39,
      child: MyStyle().showLogo(),
    );
  }
}
