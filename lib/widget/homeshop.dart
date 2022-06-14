import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:login/bodys/show_festival.dart';
import 'package:login/bodys/show_manage.dart';
import 'package:login/bodys/show_order.dart';
import 'package:login/bodys/show_product.dart';
import 'package:login/main.dart';
import 'package:login/model/user_member.dart';
import 'package:login/router.dart';
import 'package:login/show_signout.dart';
import 'package:login/states/show_editshop.dart';
import 'package:login/utility/my_style.dart';
import 'package:login/widget/authen.dart';
import 'package:login/widget/editcomment.dart';
import 'package:login/widget/editprofile.dart';
import 'package:login/widget/newhome.dart';
import 'package:login/widget/newhome1.dart';
import 'package:login/widget/newhome2.dart';
import 'package:login/widget/newhome3.dart';
import 'package:shared_preferences/shared_preferences.dart';

//---------------หน้าแรกของร้านค้า---------------------//
void main() => runApp(const HomeShop());

class HomeShop extends StatelessWidget {
  const HomeShop({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<Widget> widgets = [ShowOrder(), ShowManage(), ShowProduct1()];
  int indexWidget = 0;

  String? nameUser;
  String? profilePer;
  @override
  void initState() {
    super.initState();
    findUser();
  }

  Future<Null> findUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nameUser = preferences.getString('memberName');
      profilePer = preferences.getString('profilePer');
    });
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    //ทำอีกหน้าเพื่อมาโชว์
    Newhome(),
    // Newhome1(),
    Newhome2(),
    Newhome3(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().primaryColor,
        title: Text(
            nameUser == null ? 'BottomNavigationBar Sample' : 'ยินดีต้อนรับ'),
      ),
      drawer: Drawer(
        child: Stack(
          children: [
            ShowSignOut(),
            Column(
              children: [
                UserAccountsDrawerHeader(
                    currentAccountPicture: profilePer == ''
                        ? Image.asset('images/logo.png')
                        : CachedNetworkImage(
                            errorWidget: (context, url, error) =>
                                Image.asset('images/logo.png'),
                            imageUrl:
                                'https://travel1997zz.000webhostapp.com/profile/$profilePer'),
                    accountName: Text(nameUser.toString(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    accountEmail: Row(
                      children: [
                        MyStyle().mySizebox(),
                        Text('Login',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        // IconButton(
                        //     icon: Icon(Icons.info),
                        //     onPressed: () {
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => EditPF()));
                        //     }),
                      ],
                    )),
                menuShowOrder(),
                menuShowManage(),
                menuShowProduct(),
                menuShowFestival(),
                menuEditshop()
              ],
            )
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าแรก',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.local_activity),
          //   label: 'สำหรับฉัน',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'รีวิว',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'ที่บันทึกไว้',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal[800],
        unselectedItemColor: Colors.teal[200],
        onTap: _onItemTapped,
      ),
    );
  }

  ListTile menuShowOrder() {
    return ListTile(
      onTap: () {
        setState(() {
          _selectedIndex = 0;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ShowOrder()),
          );
        });
      },
      leading: Icon(Icons.motorcycle_rounded),
      title: Text(
        'สถานที่ท่องเที่ยว',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  ListTile menuShowManage() {
    return ListTile(
      onTap: () {
        setState(() {
          indexWidget = 1;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ShowManage()),
          );
        });
      },
      leading: Icon(Icons.store),
      title: Text(
        'ร้านค้า',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  ListTile menuShowProduct() {
    return ListTile(
      onTap: () {
        setState(() {
          _selectedIndex = 2;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ShowProduct1()),
          );
        });
      },
      leading: Icon(Icons.hotel),
      title: Text(
        'ที่พัก',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  ListTile menuShowFestival() {
    return ListTile(
      onTap: () {
        setState(() {
          _selectedIndex = 2;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ShowFestival()),
          );
        });
      },
      leading: Icon(Icons.festival),
      title: Text(
        'เทศกาล',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

    ListTile menuEditshop() {
    return ListTile(
      onTap: () {
        setState(() {
          _selectedIndex = 2;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ShowEditshop()),
          );
        });
      },
      leading: Icon(Icons.festival),
      title: Text(
        'เพิ่ม หรือ แก้ไขข้อมูล',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
