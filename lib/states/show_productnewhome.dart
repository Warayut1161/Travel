import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:login/model/user_tourist.dart';
import 'package:login/utility/my_style.dart';

class ShowProduct extends StatefulWidget {
  final UserModel2 userModel2;
  const ShowProduct({Key? key, required this.userModel2}) : super(key: key);

  @override
  State<ShowProduct> createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
  UserModel2? userModel2;
  List<UserModel2> userModels = [];
  String? resultCode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel2 = widget.userModel2;
    findLatLng();
  }

  Future<Null> findLatLng() async {
    bool locationService;
    LocationPermission locationPermission;

    locationService = await Geolocator.isLocationServiceEnabled();
    if (locationService) {
      print('Service Location Open');
    } else {
      print('Service Location Close');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userModel2!.nameTra),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              showImage(),
              Text(
                'รายละเอียด',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                userModel2 == null ? '' : userModel2!.history.toString(),
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              MyStyle().mySizebox(),
              Text(
                userModel2!.detail.toString(),
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              MyStyle().mySizebox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Text(
                  //   'ราคา: ',
                  //   style: TextStyle(fontWeight: FontWeight.bold),
                  // ),
                  Text(
                    userModel2 == null
                        ? ''
                        : 'ราคา: ${userModel2!.price.toString()}',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Text('ค่าบริการ: '),
                  Text(
                    userModel2 == null
                        ? ''
                        : 'ค่าบริการ: ${userModel2!.serviceRate.toString()}',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Text('เวลาเปิด: '),
                  Text(
                    userModel2 == null
                        ? ''
                        : 'เวลาเปิด: ${userModel2!.timeOpen.toString()}',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Text('เวลาปิด: '),
                  Text(
                    userModel2 == null
                        ? ''
                        : 'เวลาปิด: ${userModel2!.timeClose.toString()}',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Text('เบอร์ติดต่อ: '),
                  Text(
                    userModel2 == null
                        ? ''
                        : 'เบอร์ติดต่อ: ${userModel2!.contactTel.toString()}',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              MyStyle().mySizebox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Text('เบอร์ติดต่อ: '),
                  Text(
                    userModel2 == null
                        ? ''
                        : 'แฟนเพจ: ${userModel2!.linkWeb.toString()}',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Text('เบอร์ติดต่อ: '),
                  Text(
                    cutWord(
                      'Location: ${userModel2!.location.toString()}',
                    ),
                    // userModel2 == null
                    //     ? ''
                    //     : 'Location: ${userModel2!.location.toString()}',

                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     Icon(Icons.remove_red_eye_outlined,
              //         color: Color.fromARGB(255, 255, 240, 0)),
              //     Text(
              //       'จำนวนผู้เข้าชม ${userModel2!.score.toString()}',
              //       style: TextStyle(fontSize: 18),
              //     )
              //   ],
              // ),
              showMap(),
            ],
          ),
        ),
      ),
    );
  }

  Container showMap() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
      color: Colors.grey,
      height: 250,
    );
  }

  Widget showImage() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Image.network(
          'https://travel1997zz.000webhostapp.com/pictuer/${userModel2!.imgProfile}',
          fit: BoxFit.contain,
        ));
  }

  String cutWord(String location) {
    String result = location;
    if (result.length > 14) {
      result = result.substring(0, 40);
      result = '$result ...';
    }
    return result;
  }
}
