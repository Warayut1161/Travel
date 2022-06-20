import 'package:flutter/material.dart';

//-------------โชว์หน้าแรกในส่วนแถบของบันทึกไว้------------//

class Newhome3 extends StatefulWidget {
  const Newhome3({Key? key}) : super(key: key);

  @override
  State<Newhome3> createState() => _Newhome3State();
}

class _Newhome3State extends State<Newhome3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ที่บันทึกไว้'),
        
      ),
    );
  }
}
