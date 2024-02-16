import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_design/component/Task.dart';
import 'package:ui_design/component/UpComingTasks.dart';

import 'package:ui_design/component/notification.dart';
import 'package:ui_design/screen/user/Nextpage.dart';
import 'package:ui_design/screen/user/Profile.dart';
import 'package:ui_design/screen/user/wallet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> userDetails = {};
  Map<String, dynamic> activeTask = {};
  List<Map<String, dynamic>> availableTasks = [];

  bool isTaskActive = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserDetail();
    getAllUpcomingTasks();
  }

  getUserDetail() async {
    print("object");
    String userId = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance
        .collection("Users")
        .doc(userId)
        .get()
        .then((response) {
      setState(() {
        userDetails = response.data()!;
      });
      print(response.data());
      if (response.data()!['activeTask'] != null &&
          response.data()!['activeTask'] != "") {
        print('ppp');
        print(response.data()!['activeTask']);
        getAtiveTask(response.data()!['activeTask']);
      }
    });
  }

  getAtiveTask(id) async {
    await FirebaseFirestore.instance
        .collection("Tasks")
        .doc(id)
        .get()
        .then((response) {
      setState(() {
        activeTask = {...response.data()!, "id": response.id};
        // activeTask[id] = response.id;
        isTaskActive = true;
      });
    });
    print(activeTask);
  }

  getAllUpcomingTasks() async {
    await FirebaseFirestore.instance
        .collection("Tasks")
        .where("assignedTo", isEqualTo: null)
        .get()
        .then((response) {
      List<Map<String, dynamic>> tempRecords = [];
      response.docs.forEach((element) {
        tempRecords.add(element.data());
      });

      setState(() {
        availableTasks = tempRecords;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEAF0F0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi, ${userDetails['Name']}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontFamily: GoogleFonts.inter().fontFamily,
                              ),
                            ),
                            Text(
                              'Are you ready to get back to work?',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                fontFamily: GoogleFonts.inter().fontFamily,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Color(0xffFB6565),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //-------------------component----------------------------
                SizedBox(
                  height: 20,
                ),
                isTaskActive
                    ? Task(
                        title: activeTask['Title'],
                        time: activeTask['assignedAt'],
                        month: "hghg",
                        year: ' 2020',
                        endtime: activeTask['id'])
                    : Center(
                        child: Text("No Active task"),
                      ),
                SizedBox(
                  height: 20,
                ),

                // Upcoming Tasks
                UpcomingTasks(dataStream: availableTasks)
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xff0047AB),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              },
              child: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ),
                );
              },
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Wallet(),
                  ),
                );
              },
              child: Icon(
                Icons.wallet,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
