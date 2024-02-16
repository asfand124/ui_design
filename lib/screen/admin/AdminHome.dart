import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_design/component/Task.dart';
import 'package:ui_design/component/UpComingTasks.dart';

import 'package:ui_design/component/notification.dart';
import 'package:ui_design/screen/admin/Addtask.dart';
import 'package:ui_design/screen/user/Nextpage.dart';
import 'package:ui_design/screen/user/Profile.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  List<Map<String, dynamic>> avalibleTasks = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllUpcomingTasks();
  }

  getAllUpcomingTasks() async {
    await FirebaseFirestore.instance
        .collection("Tasks")
        .where("assignedTo", isEqualTo: null)
        .get()
        .then((response) {
      List<Map<String, dynamic>> tempRecords = [];
      response.docs.forEach((element) {
        tempRecords.add({...element.data(), "id": element.id});
      });

      setState(() {
        avalibleTasks = tempRecords;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, umer lodhi',
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
              SizedBox(
                height: 10,
              ),
          
              UpcomingTasks(dataStream: avalibleTasks),
          
              //
            ],
          ),
        ),
      
    );
  }
}
