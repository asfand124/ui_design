import 'package:flutter/material.dart';
import 'package:ui_design/screen/user/Home.dart';
import 'package:ui_design/screen/user/Profile.dart';
import 'package:ui_design/screen/user/UserSetting.dart';
import 'package:ui_design/screen/user/wallet.dart';

class PageNavigation extends StatefulWidget {
  const PageNavigation({Key? key}) : super(key: key);

  @override
  _PageNavigationState createState() => _PageNavigationState();
}

class _PageNavigationState extends State {
  int _selectedTab = 0;

  List _pages = [
    Home(),
    Wallet(),
    Profile(),
    Center(
      child: Text("Contact"),
    ),
    UserSetting()
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdddaff),
      body: SafeArea(child: _pages[_selectedTab]),
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: Color.fromARGB(255, 44, 62, 168),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: (index) => _changeTab(index),
          selectedItemColor: Color.fromARGB(255, 158, 11, 216),
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "About"),
            BottomNavigationBarItem(
                icon: Icon(Icons.wallet_rounded), label: "Product"),
            BottomNavigationBarItem(
                icon: Icon(Icons.contact_mail), label: "Contact"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
        ),
      ),
    );
  }
}
