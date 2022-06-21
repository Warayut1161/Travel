import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login/model/user_showsearch.dart';
import 'package:login/model/user_tourist.dart';
import 'package:login/states/show_productnewhome.dart';
import 'package:login/widget/newhome3.dart';

class RandomWordsState extends StatefulWidget {
  dynamic userModel;

  List? search;
  RandomWordsState({this.userModel});

  @override
  State<RandomWordsState> createState() => _RandomWordsStateState();
}

class _RandomWordsStateState extends State<RandomWordsState> {
  dynamic testt;
  bool load = true;
  List<UserModel2> userModels = [];
  List<UserModel3> userModelss = [];
  TextEditingController editingController = TextEditingController();
  bool? searching;
  var data;
  String? query;
  final _saved = Set<BuildContext>();
  @override
  void initState() {
    searching = false;
    super.initState();
  }

  //-----------
  bool? status = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show search'),
      ),

      //-----------------------ค้นหา---------------------//
    );
  }

  // Widget builds(BuildContext context) {
  // final alreadySaved = _saved.contains(context);
  // return Scaffold(
  //   body: GridView.builder(
  //     itemCount: userModelss.length,
  //     gridDelegate:
  //         SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300),
  //     itemBuilder: (context, index) => GestureDetector(
  //       onTap: () {
  //         print('You Click from ${userModels[index].nameTra}');
  //         Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (context) =>
  //                     ShowProduct(userModel2: userModels[index])));
  //       },
  //       child: Card(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           children: [
  //             Container(
  //               width: 80,
  //               height: 80,
  //               child: CachedNetworkImage(
  //                   fit: BoxFit.cover,
  //                   imageUrl:
  //                       'https://travel1997zz.000webhostapp.com/pictuer/${userModels[index].imgProfile}'),
  //             ),
  //             Text(cutWord(userModels[index].nameTra),
  //                 style: TextStyle(
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.black)),
  //             // ListTile(
  //             //   trailing: Icon(
  //             //       alreadySaved ? Icons.favorite : Icons.favorite_border,
  //             //       color: alreadySaved ? Colors.red : null),
  //             //   onTap: () {
  //             //     setState(() {
  //             //       if (alreadySaved) {
  //             //         _saved.remove(context);
  //             //       } else {
  //             //         _saved.add(context);
  //             //       }
  //             //     });
  //             //     print('_saved.add = $_saved.add');
  //             //     print('_saved.remove = $_saved.remove');
  //             //   },
  //             // )
  //             IconButton(
  //               icon: Icon(
  //                   alreadySaved ? Icons.bookmark : Icons.bookmark_border,
  //                   color: alreadySaved ? Colors.black54 : null),
  //               onPressed: () {
  //                 // setState(() {
  //                 setState(() {
  //                   if (alreadySaved) {
  //                     _saved.remove(context);
  //                   } else {
  //                     _saved.add(context);
  //                   }
  //                 });
  //                 print('_saved.add = $_saved.add');
  //                 print('_saved.remove = $_saved.remove');
  //                 print('alreadySaved = $alreadySaved');

  //                 //   if (alreadySaved == null) {}
  //                 //   // if (alreadySaved) {
  //                 //   //   _saved.remove(context);
  //                 //   // } else {
  //                 //   //   _saved.add(context);
  //                 //   // }
  //                 // });
  //                 // print('_saved.add = $_saved.add');
  //                 // print('_saved.remove = $_saved.remove');
  //                 // print('alreadySaved = $alreadySaved');
  //               },

  //               //   // IconButton(
  //               //   //     onPressed: () {},
  //               //   //     icon: Icon(
  //               //   //       Icons.bookmark_border,
  //               //   //       color: Colors.black26,
  //               //   //     )),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   ),

  //   //-----------------------ค้นหา---------------------//
  // );
  // }

  String cutWord(String nameTra) {
    String result = nameTra;
    if (result.length > 14) {
      result = result.substring(0, 10);
      result = '$result ...';
    }
    return result;
  }
}
