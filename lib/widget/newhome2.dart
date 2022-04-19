import 'package:flutter/material.dart';
import 'package:login/model/user_member.dart';

class Newhome2 extends StatefulWidget {
  const Newhome2({Key? key}) : super(key: key);

  @override
  State<Newhome2> createState() => _Newhome2State();
}

class _Newhome2State extends State<Newhome2> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รีวิวร้านค้าต่างๆ'),
      ),
      body: Text(''),
    );
  }
}
