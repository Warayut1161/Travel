import 'package:flutter/material.dart';

class ShowEditshop extends StatefulWidget {
  const ShowEditshop({ Key? key }) : super(key: key);

  @override
  State<ShowEditshop> createState() => _ShowEditshopState();
}

class _ShowEditshopState extends State<ShowEditshop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('แก้ไขข้อมูล'),)
      
    );
  }
}