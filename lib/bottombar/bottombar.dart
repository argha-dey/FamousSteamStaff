import 'package:famous_steam_staff/bottombar/setting_page.dart';
import 'package:famous_steam_staff/sevicedetails/orderList.dart';
import 'package:flutter/material.dart';

import 'homePage2.dart';

class BottomBarpage extends StatefulWidget {
  const BottomBarpage({Key? key,required this.pageIndex}) : super(key: key);
  final int pageIndex;
  @override
  State<BottomBarpage> createState() => _BottomBarpageState();
}

class _BottomBarpageState extends State<BottomBarpage> {
  int _selectedIndex = 0;
  List widgetOptions = [
    const SettingPage(),
    const Home2Screen(),
    const OrderListScreen(),
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedIndex = widget.pageIndex;
    });

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        bottomNavigationBar: Container(
          alignment: Alignment.bottomCenter,
          height: 120,
          decoration: const BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                  image: AssetImage('assets/images/bottombar.png'),
                  fit: BoxFit.fill)),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Image.asset('assets/images/Settings.png', height: 40),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0.3,
                              spreadRadius: 0.4)
                        ],
                        shape: BoxShape.circle),
                    child:
                        Image.asset('assets/images/dog_house.png', height: 40)),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/images/book.png', height: 40),
                label: '',
              ),
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: _selectedIndex,
            onTap: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
          ),
        ),
        body: widgetOptions[_selectedIndex],
      ),
    );
  }
}
