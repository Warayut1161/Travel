import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowEditshop extends StatefulWidget {
  const ShowEditshop({Key? key}) : super(key: key);

  @override
  State<ShowEditshop> createState() => _ShowEditshopState();
}

class _ShowEditshopState extends State<ShowEditshop> {
  @override
  void initState() {
    super.initState();
    loadValueFromAPI();
  }

  Future<Null> loadValueFromAPI() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? memberId = preferences.getString('memberId');
    String apiGetProductWhereMemberId =
        'https://travel1997zz.000webhostapp.com/API2/getProductWhereMemberId.php?isAdd=true&member_id=$memberId';
    await Dio()
        .get(apiGetProductWhereMemberId)
        .then((value) => print('value ===>$value'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('แก้ไขข้อมูล'),
    ));
  }
}
