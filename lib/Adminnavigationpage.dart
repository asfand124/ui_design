import 'package:flutter/material.dart';
import 'package:ui_design/screen/admin/Addtask.dart';
import 'package:ui_design/screen/admin/AdminHome.dart';
import 'package:ui_design/screen/admin/AproveTasks.dart';
import 'package:ui_design/screen/user/Home.dart';
import 'package:ui_design/screen/user/Profile.dart';
import 'package:ui_design/screen/user/wallet.dart';

class AdminPageNavigation extends StatefulWidget {
  const AdminPageNavigation({Key? key}) : super(key: key);

  @override
  _AdminPageNavigationState createState() => _AdminPageNavigationState();
}

class _AdminPageNavigationState extends State {
  int _selectedTab = 0;

  List _pages = [
    AdminHome(),
    AddTask(),
    AproveTaks(),
    Center(
      child: Text("Contact"),
    ),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_selectedTab]),
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: Color.fromARGB(255, 73, 97, 235),
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
            BottomNavigationBarItem(icon: Icon(Icons.task), label: "About"),
            BottomNavigationBarItem(
                icon: Icon(Icons.wallet_rounded), label: "Product"),
            BottomNavigationBarItem(
                icon: Icon(Icons.contact_mail), label: "Contact"),
          ],
        ),
      ),
    );
  }
}
