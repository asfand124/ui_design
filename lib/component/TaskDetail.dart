import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_design/PageNavigation.dart';
import 'package:ui_design/logics/User.dart';

import '../screen/user/Home.dart';

class TaskDetail extends StatelessWidget {
  final Map<String, dynamic> taskDetails;
  const TaskDetail({super.key, required this.taskDetails});
  @override
  Widget build(BuildContext context) {
    updateUserActiveTask() {
      try {
        FirebaseFirestore.instance
            .collection("Users")
            .doc(getUserId())
            .update({'activeTask': taskDetails['id']}).then((value) {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => PageNavigation())));
        });
      } on FirebaseException catch (e) {
        print(e.code);
      }
    }

    startTask() {
      getUserCurrentTaskId().then((value) {
        print(value);
        if (value == "") {
          print("Asign task : ${taskDetails['id']}");
          try {
            FirebaseFirestore.instance
                .collection("Tasks")
                .doc(taskDetails['id'])
                .update({
              "assignedAt": FieldValue.serverTimestamp(),
              "assignedTo": getUserId()
            }).then((value) {
              updateUserActiveTask();
            });
          } on FirebaseException catch (e) {
            print(e.code);
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('You Already Have A Task Running'),
          ));
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          "${taskDetails["Title"]}",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Discription',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text('${taskDetails['Desc']}'),
              SizedBox(
                height: 10,
              ),
              Text(
                'Time for task',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '${taskDetails['alottedTimeInHours']} Hr',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.inter().fontFamily,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'State',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
              ),
              Text(
                '${taskDetails['difficulty']}',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.inter().fontFamily,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Frame Work',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
              ),
              Text('${taskDetails['frameWork']}'),
              SizedBox(
                height: 10,
              ),
              Text(
                'Project',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
              ),
              Text('${taskDetails['belongsTo']}'),
              SizedBox(
                height: 10,
              ),
              Text(
                'Leader',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
              ),
              Text('${taskDetails['leadedBy']}'),
              SizedBox(
                height: 10,
              ),
              Text(
                'Createed At',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
              ),
              Text('${taskDetails['createdAt'].toDate()}'),
              SizedBox(
                height: 20,
              ),
              getUserType() == "admin"
                  ? SizedBox()
                  : Center(
                      child: ElevatedButton(
                          onPressed: startTask,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff349EFF),
                              minimumSize: Size(120, 50),
                              elevation: 0),
                          child: Text(
                            "Start",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontFamily: GoogleFonts.inter().fontFamily,
                                color: Colors.white),
                          )),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
