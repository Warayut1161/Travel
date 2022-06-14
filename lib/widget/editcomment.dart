import 'package:flutter/material.dart';
import 'package:login/utility/my_style.dart';

class ShowEditReview extends StatefulWidget {
  const ShowEditReview({Key? key}) : super(key: key);

  @override
  State<ShowEditReview> createState() => _ShowEditReviewState();
}

class _ShowEditReviewState extends State<ShowEditReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รีวิว'),
      ),
      body: Text(
        'รายละเอียด',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
