import 'package:flutter/material.dart';
import 'package:login/utility/my_style.dart';
import 'package:login/widget/authen.dart';
import 'package:shared_preferences/shared_preferences.dart';

//--------------โชว์ปุ่ม Logout----------------//

class ShowSignOut extends StatelessWidget {
  const ShowSignOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(
          onTap: () async {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.clear().then(
                  (value) => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Authen()),
                      (Route<dynamic> route) => false),
                );
          },
          tileColor: Colors.red.shade900,
          leading: Icon(
            Icons.exit_to_app,
            size: 36,
            color: Colors.white,
          ),
          title: MyStyle().titleH4('ออกจากระบบ'),
          subtitle: MyStyle().titleH5('กลับไปหน้า เข้าสู่ระบบ'),
        ),
      ],
    );
  }
}
