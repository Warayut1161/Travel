import 'package:flutter/material.dart';
import 'package:login/model/user_member.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

//----------------แก้ไขข้อมูล ส่วนนี้ยังไม่ได้ใช้-----------------//

class EditPF extends StatefulWidget {
  const EditPF({Key? key}) : super(key: key);

  @override
  State<EditPF> createState() => _EditPFState();
}

UserModel? _userModel;

class _EditPFState extends State<EditPF> {
  @override
  void initState() {
    super.initState();
    findUserModel();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลส่วนตัว'),
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false, // Close BackForward NajaEiEi
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.home))],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(
                      'ข้อมูลส่วนตัวของนักศึกษา',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //_______________________     Method Start__________________________//
  Future findUserModel() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefer = await SharedPreferences.getInstance();
    String? memberUsername = prefer.getString('memberUsername');
    // String? std_idcard = prefer.getString('std_idcard');
    String apiprofile =
        'https://travel1997zz.000webhostapp.com/API2/getUserWhereIdcom.php';
    await Dio().get(apiprofile).then((value) {
      // then แปลว่า "แล้ว" ใช้ต่อจากคำสั่งบางตัว //
      print('## ===>> $value');
      for (var item in json.decode(value.data)) {
        setState(() {
          _userModel = UserModel.fromJson(item);
        });
      }
    });
  }
}
