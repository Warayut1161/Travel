import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login/model/user_tourist.dart';
import 'package:login/states/show_festivalnewhome.dart';
import 'package:login/states/show_productnewhome.dart';
import 'package:login/utility/my_style.dart';
import 'package:login/widget/show_progress.dart';

class ShowFestival extends StatefulWidget {
  const ShowFestival({Key? key}) : super(key: key);

  @override
  State<ShowFestival> createState() => _ShowFestivalState();
}

class _ShowFestivalState extends State<ShowFestival> {
  bool load = true;
  List<UserModel2> userModels = [];
  @override
  void initState() {
    super.initState();
    readApiAll();
  }

  Future<Null> readApiAll() async {
    String urlAPI =
        'https://travel1997zz.000webhostapp.com/API2/getUserWhereFestival.php';
    await Dio().get(urlAPI).then((value) {
      setState(() {
        load = false;
      });
      //print('value ==> $value');
      var result = json.decode(value.data);
      for (var item in result) {
        // print('item ==> $item');
        UserModel2 model = UserModel2.fromJson(item);
        //print('name ==> ${model.nameTra}');
        setState(() {
          userModels.add(model);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: load
          ? ShowProgress()
          : GridView.builder(
              itemCount: userModels.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 160),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  print('You click from ${userModels[index].nameTra}');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ShowFestivalnewhome(userModel2: userModels[index]),
                      ));
                },
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl:
                                'https://travel1997zz.000webhostapp.com/pictuer/${userModels[index].imgProfile}'),
                      ),
                      Text(cutWord(userModels[index].nameTra),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ),
      appBar: AppBar(
        backgroundColor: MyStyle().Plamcolor,
        title: Text('เทศกาล'),
      ),
    );
  }

  String cutWord(String nameTra) {
    String result = nameTra;
    if (result.length > 14) {
      result = result.substring(0, 10);
      result = '$result ...';
    }
    return result;
  }
}
