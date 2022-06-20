import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login/model/user_tourist.dart';
import 'package:login/states/show_productnewhome.dart';
import 'package:login/widget/newhome3.dart';

//----------------ข้อมูลที่โชว์ของหน้าแรก------------------//

class Newhome extends StatefulWidget {
  const Newhome({Key? key}) : super(key: key);

  @override
  State<Newhome> createState() => _NewhomeState();
}

class _NewhomeState extends State<Newhome> {
  bool load = true;
  List<UserModel2> userModels = [];
  TextEditingController editingController = TextEditingController();
  bool? searching;
  var data;
  String? query;
  final _saved = Set<BuildContext>();
  @override
  void initState() {
    searching = false;
    super.initState();
    readApiAll();
  }

  //-----------
  bool? status = true;

  //------

  //-----------------------ส่วนเก็บข้อมูลตัวค้นหา----------------------------//
  Future<Null> getSearch() async {
    //-------------

    //-------------
    String api =
        'https://travel1997zz.000webhostapp.com/API2/search_name.php?isAdd=true&name_tra=${editingController.text}'; //ลิงค์ api

    await Dio().get(api).then((value) {
      print(json.decode(value.toString()));

      // setState(() {
      //   load = false;
      // });
      // //print('value ==> $value');
      // // var result = json.decode(value.data);
      // for (var item in json.decode(value.data)) {
      //   // print('item ==> $item');
      //   UserModel2 userModel = UserModel2.fromJson(item);
      //   // print('name ==> ${model.nameTra}');
      //   setState(() {
      //     userModels.add(userModel);
      //   });
      // }

      // if (value.toString() != Null) {
      //   for (var item in json.decode(value.data)) {
      //     UserModel2 userModel =
      //         UserModel2.fromJson(item); // Map ใส่ model ที่เราจะเก็บไว้
      //     setState(() {
      //       userModels.add(userModel); // แอดใส่ list ที่เราสร้าง
      //     });
      //   }
      // }
    });
  }

  //----------------------------------------------------------------//
  Future<Null> readApiAll() async {
    String urlAPI =
        'https://travel1997zz.000webhostapp.com/API2/getUserWhereIdcom.php';
    await Dio().get(urlAPI).then((value) {
      setState(() {
        load = false;
      });
      //print('value ==> $value');
      var result = json.decode(value.data);
      for (var item in result) {
        // print('item ==> $item');
        UserModel2 model = UserModel2.fromJson(item);
        // print('name ==> ${model.nameTra}');
        setState(() {
          userModels.add(model);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final alreadySaved = _saved.contains(context);
    return Scaffold(
      body: GridView.builder(
        itemCount: userModels.length,
        gridDelegate:
            SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            print('You Click from ${userModels[index].nameTra}');
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ShowProduct(userModel2: userModels[index])));
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
                // ListTile(
                //   trailing: Icon(
                //       alreadySaved ? Icons.favorite : Icons.favorite_border,
                //       color: alreadySaved ? Colors.red : null),
                //   onTap: () {
                //     setState(() {
                //       if (alreadySaved) {
                //         _saved.remove(context);
                //       } else {
                //         _saved.add(context);
                //       }
                //     });
                //     print('_saved.add = $_saved.add');
                //     print('_saved.remove = $_saved.remove');
                //   },
                // )
                IconButton(
                  icon: Icon(
                      alreadySaved ? Icons.bookmark : Icons.bookmark_border,
                      color: alreadySaved ? Colors.black54 : null),
                  onPressed: () {
                    // setState(() {
                    setState(() {

                      if (alreadySaved) {
                        _saved.remove(context);
                      } else {
                        _saved.add(context);
                      }
                    });
                    print('_saved.add = $_saved.add');
                    print('_saved.remove = $_saved.remove');
                    print('alreadySaved = $alreadySaved');
                  

                    //   if (alreadySaved == null) {}
                    //   // if (alreadySaved) {
                    //   //   _saved.remove(context);
                    //   // } else {
                    //   //   _saved.add(context);
                    //   // }
                    // });
                    // print('_saved.add = $_saved.add');
                    // print('_saved.remove = $_saved.remove');
                    // print('alreadySaved = $alreadySaved');
                  },

                  //   // IconButton(
                  //   //     onPressed: () {},
                  //   //     icon: Icon(
                  //   //       Icons.bookmark_border,
                  //   //       color: Colors.black26,
                  //   //     )),
                ),
              ],
            ),
          ),
        ),
      ),
      
      //-----------------------ค้นหา---------------------//
      appBar: AppBar(
        title: searching! ? searchField() : Text(''),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  searching = true;
                  print(editingController.text);
                  if (editingController.text.isNotEmpty) {
                    getSearch();
                    editingController.clear();
                  }
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const Newhome3()));
                });
              }),
        ],
      ),
      
    );
  }

  Widget searchField() {
    return Container(
        child: TextField(
      controller: editingController,
      autofocus: true,
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {
        searching = true;
        print(editingController.text);
        if (editingController.text.isNotEmpty) {
          getSearch(); //--//
          editingController.clear();
        }
      },
      style: TextStyle(color: Colors.white, fontSize: 18),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.white, fontSize: 18),
        hintText: "พิมพ์คำค้นหา",
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
      ),
    ));
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
