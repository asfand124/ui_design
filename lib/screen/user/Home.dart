import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_design/Shimmers/HomeShimmer.dart';
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
  bool isPageLoading = true;
  bool isTaskActive = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserDetail();
  }

  getUserDetail() async {
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
    getAllUpcomingTasks();
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
        tempRecords.add({...element.data(), 'id': element.id});
      });

      setState(() {
        availableTasks = tempRecords;
        isPageLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isPageLoading
        ? HomeShimmer()
        : Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: SingleChildScrollView(
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
                      height: 10,
                    ),

                    isTaskActive
                        ? Task(
                            title: activeTask['Title'],
                            time: activeTask['assignedAt'].toDate(),
                            taskID: activeTask['id'],
                            submitForApproval:
                                activeTask['submittedForApproval'],
                            allotedTime: int.parse(activeTask['alottedTimeInHours']),
                          )
                        : Center(
                            child: Text("No Active task"),
                          ),
                    SizedBox( 
                      height: 10,
                    ),

                    // Upcoming Tasks
                    UpcomingTasks(dataStream: availableTasks)
                  ],
                ),
              ),
            ),
          );
  }
}
