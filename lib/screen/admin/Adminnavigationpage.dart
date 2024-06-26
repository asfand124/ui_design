import 'package:flutter/material.dart';
import 'package:ui_design/screen/admin/Addtask.dart';
import 'package:ui_design/screen/admin/AdminHome.dart';
import 'package:ui_design/screen/admin/AproveTasks.dart';
import 'package:ui_design/screen/admin/payment.dart';
import 'package:ui_design/screen/admin/userTaskPayment.dart';


class AdminPageNavigation extends StatefulWidget {
  int tabNo;
    AdminPageNavigation({super.key,
   this.tabNo = 0,
  });

  @override
  _AdminPageNavigationState createState() => _AdminPageNavigationState();
}

class _AdminPageNavigationState extends State<AdminPageNavigation> {
  int? _selectedTab;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _selectedTab = widget.tabNo;
    });
  }
  List _pages = [
    AdminHome(),
    AddTask(),
    AproveTaks(),
    UserTaskPayment(),
    payment(),

  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_selectedTab!]),
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: Color.fromARGB(255, 73, 97, 235),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedTab!,
          onTap: (index) => _changeTab(index),
          selectedItemColor: Color.fromARGB(255, 158, 11, 216),
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_task,
                  color: Colors.white,
                ),
                label: "Add Task"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.grade,
                  color: Colors.white,
                ),
                label: "Grade"),
                  BottomNavigationBarItem(
                icon: Icon(
                  Icons.task_rounded,
                  color: Colors.white,
                ),
                label: "task type"),
                  BottomNavigationBarItem(
                icon: Icon(
                  Icons.wallet,
                  color: Colors.white,
                ),
                label: "wallet"),
          ],
        ),
      ),
    );
  }
}
