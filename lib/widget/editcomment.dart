import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/utility/my_style.dart';

class ShowEditReview extends StatefulWidget {
  const ShowEditReview({Key? key}) : super(key: key);

  @override
  State<ShowEditReview> createState() => _ShowEditReviewState();
}

File? file;
final formKey = GlobalKey<FormState>();

class _ShowEditReviewState extends State<ShowEditReview> {
  Row builName(double size) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: EdgeInsets.only(top: 16),
        width: size * 0.6,
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'กรุณากรอก Name';
            } else {}
          },
          decoration: InputDecoration(
            hintText: 'Name :',
            prefixIcon: Icon(Icons.fingerprint),
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
      )
    ]);
  }

  Row buildetails(double size) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: EdgeInsets.only(top: 16),
        width: size * 0.6,
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'กรุณากรอก รายละเอียด';
            } else {}
          },
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'รายละเอียด :',
            prefixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
              child: Icon(Icons.edit),
            ),
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
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('รีวิว'),
        
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildTitle('ชื่อ'),
                builName(size),
                buildTitle('รายละเอียด'),
                buildetails(size),
                buildTitle('รูปภาพ'),
                buildAvatar(size),
                buildCreate(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  RaisedButton buildCreate() {
    return RaisedButton(
      color: MyStyle().darkColor,
      onPressed: () {
        if (formKey.currentState!.validate()) {}
      },
      child: Text(
        'บันทึก',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Future<Null> chooseImage(ImageSource source) async {
    try {
      var result = await ImagePicker().getImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );
      setState(() {
        file = File(result!.path);
      });
    } catch (e) {}
  }

  Row buildAvatar(double size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => chooseImage(ImageSource.camera),
          icon: Icon(Icons.add_a_photo),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: size * 0.6,
          child: file == null
              ? Image.asset('images/imagess.png')
              : Image.file(file!),
        ),
        IconButton(
          onPressed: () => chooseImage(ImageSource.gallery),
          icon: Icon(Icons.add_photo_alternate),
        ),
      ],
    );
  }

  Container buildTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
