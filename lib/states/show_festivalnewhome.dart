import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:login/model/user_tourist.dart';
import 'package:login/utility/my_dialog.dart';
import 'package:login/utility/my_style.dart';
import 'package:login/widget/show_progress.dart';

//---------------------------โชว์หน้าต่างข้อมูลรายละเอียดเทศกาล--------------------//
class ShowFestivalnewhome extends StatefulWidget {
  final UserModel2 userModel2;
  const ShowFestivalnewhome({Key? key, required this.userModel2}) : super(key: key);

  @override
  State<ShowFestivalnewhome> createState() => _ShowFestivalnewhomeState();
}

class _ShowFestivalnewhomeState extends State<ShowFestivalnewhome> {
  UserModel2? userModel2;
  List<UserModel2> userModels = [];
  String? resultCode;
  double? lat1, lng1;
  LatLng? latLng;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    userModel2 = widget.userModel2;
    checkPermission();
    findLatLng();
  }

  //ส่วนของ Location
  Future<Null> checkPermission() async {
    bool locationService;
    LocationPermission locationPermission;

    locationService = await Geolocator.isLocationServiceEnabled();
    if (locationService) {
      print('Service Location Open');

      locationPermission = await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.denied) {
        locationPermission = await Geolocator.requestPermission();
        if (locationPermission == LocationPermission.deniedForever) {
          MyDialog().alertLocationService(
              context, 'ไม่อนุญาติแชร์ Location', 'โปรดแชร์ Location');
        } else {
          //Find LatLng
          findLatLng();
        }
      } else {
        if (locationPermission == LocationPermission.deniedForever) {
          MyDialog().alertLocationService(
              context, 'ไม่อนุญาติแชร์ Location', 'โปรดแชร์ Location');
        } else {
          //Find LatLng
          findLatLng();
        }
      }
    } else {
      print('Service Location Close');
      MyDialog().alertLocationService(
          context, 'Location Service ปิดอยู่', 'กรุณาเปิด Location Service');
    }
  }

  Future<Null> findLatLng() async {
    print('findLatLng ==> Work');
    Position? position = await findPosition();
    // if (position != null) {
    //   // setState(() {
    //   //   latLng = LatLng(position.latitude, position.longitude);
    //   //   print('lat = ${latLng!.latitude}');
    //   // });
    // }
    setState(() {
      lat1 = position!.latitude;
      lng1 = position.longitude;
      print('lat = $lat1, lng = $lng1');
    });
  }

  Future<Position?> findPosition() async {
    Position position;
    try {
      position = await Geolocator.getCurrentPosition();
      return position;
    } catch (e) {
      return null;
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
                userModel2 == '' ? '' : userModel2!.history.toString(),
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
                  // ส่วนของการโชว์ค่า สิ่งอำนวยความสะดวกของสถานที่
                  Text(
                    userModel2!.price.toString() == ''
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
                    userModel2!.serviceRate.toString() == ''
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
                    userModel2!.timeOpen.toString() == ''
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
                    userModel2!.timeClose.toString() == ''
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
                    userModel2!.contactTel.toString() == ''
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
                  // Text('แฟนเพจ: '),
                  Text(
                    userModel2!.linkWeb.toString() == ''
                        ? ''
                        : 'แฟนเพจ: ${userModel2!.linkWeb.toString()},',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              // showMap(),
              MyStyle().mySizebox(),
            ],
          ),
        ),
      ),
    );
  }

  //  ส่วนของหน้าต่าง โชว์ googleMap
  
  // Widget showMap() => Container(
  //       width: double.infinity,
  //       height: 300,
  //       child: lat1 == null
  //           ? ShowProgress()
  //           : GoogleMap(
  //               myLocationEnabled: true,
  //               initialCameraPosition:  CameraPosition(
  //                   // target: latLng!,
  //                   target: LatLng(
  //                      double.parse(
  //                       userModel2!.lat.toString(),
  //                     ),
  //                     double.parse(
  //                       userModel2!.lng.toString(),
  //                     ),
  //                   ),
  //                   zoom: 16),
  //               onMapCreated: (controller) => {},
  //               markers: setMarker(),
  //             ),

        // margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
        // color: Colors.grey,
        // height: 250,
      // );

  // ส่วนของโชว์ รูปโปรไฟล์
  Widget showImage() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Image.network(
          'https://travel1997zz.000webhostapp.com/pictuer/${userModel2!.imgProfile}',
          fit: BoxFit.contain,
        ));
  }

  //ส่วนเอาไว้ตัดคำ ที่เป็นเกินขอบจอโทรศัพท์
  String cutWord(String linkWeb) {
    String result = linkWeb;
    if (result.length > 14) {
      result = result.substring(0, 40);
      result = '$result ...';
    }
    return result;
  }
}
