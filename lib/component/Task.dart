import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_design/PageNavigation.dart';
import 'package:ui_design/component/TaskTimer.dart';
import 'package:ui_design/screen/user/Home.dart';
import 'package:ui_design/Authentication/Login.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Task extends StatefulWidget {
  final title;
  final time;
  final taskID;
  final bool submitForApproval;
  Task({
    super.key,
    required this.title,
    required this.time,
    required this.taskID,
    required this.submitForApproval,
  });

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int noofmaps = 0;
  int noofapicall = 0;
  int noofcharts = 0;
  int noofcondition = 0;
  bool isReponsive = false;

  TextEditingController _commentController = TextEditingController();
  ActiveBtnHandler() {
    FirebaseFirestore.instance.collection("Tasks").doc(widget.taskID).update({
      "submittedForApproval": true,
      "TaskData": {
        "Comment": _commentController.text,
        "Responsive": isReponsive,
        "NoApiCalls": noofapicall,
        "NoChart": noofcharts,
        "NoCondition": noofcondition,
        "NoMaps": noofmaps,
      },
    }).then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => PageNavigation())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Active Task',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.inter().fontFamily,
                  color: Colors.grey),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '${widget.title}',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.inter().fontFamily,
              ),
            ),
            Row(
              children: [
                Text(
                  'Started at  : ',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: GoogleFonts.inter().fontFamily,
                      color: Colors.grey),
                ),
                Text(
                  "${widget.time.toDate()}",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Text(
                    'Time Left  : ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: GoogleFonts.inter().fontFamily,
                        color: Colors.grey),
                  ),
                  TaskTimer()
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    if (widget.submitForApproval) {
                      // ScaffoldMessenger.of(context)
                      //     .showSnackBar(SnackBar(content: Text("data")));
                      EasyLoading.showToast(
                          "Approval Already send please wait");
                    } else {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(
                            builder: (BuildContext context,
                                StateSetter setState /*You can rename this!*/) {
                              return SingleChildScrollView(
                                child: SafeArea(
                                  child: Container(
                                    height: 700,
                                    color: Color.fromARGB(255, 255, 247, 251),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        TextField(
                                          controller: _commentController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Name',
                                              labelText: "Commit Name"),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text("Number Of APIS Calls"),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            IconButton(
                                              iconSize: 40,
                                              color: Colors.red,
                                              onPressed: () {
                                                setState(() {
                                                  noofapicall--;
                                                });
                                              },
                                              icon:
                                                  Icon(Icons.exposure_minus_1),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                "$noofapicall",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 25,
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              iconSize: 40,
                                              color: Colors.green,
                                              onPressed: () {
                                                setState(() {
                                                  noofapicall++;
                                                });
                                              },
                                              icon: Icon(Icons.plus_one),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text("Number Of Maps"),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            IconButton(
                                              iconSize: 40,
                                              color: Colors.red,
                                              onPressed: () {
                                                setState(() {
                                                  noofmaps--;
                                                });
                                              },
                                              icon:
                                                  Icon(Icons.exposure_minus_1),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                "$noofmaps",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 25,
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              iconSize: 40,
                                              color: Colors.green,
                                              onPressed: () {
                                                setState(() {
                                                  noofmaps++;
                                                });
                                              },
                                              icon: Icon(Icons.plus_one),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text("Number Of Charts"),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            IconButton(
                                              iconSize: 40,
                                              color: Colors.red,
                                              onPressed: () {
                                                setState(() {
                                                  noofcharts--;
                                                });
                                              },
                                              icon:
                                                  Icon(Icons.exposure_minus_1),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                "$noofcharts",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 25,
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              iconSize: 40,
                                              color: Colors.green,
                                              onPressed: () {
                                                setState(() {
                                                  noofcharts++;
                                                });
                                              },
                                              icon: Icon(Icons.plus_one),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text("Number Of Conditions"),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            IconButton(
                                              iconSize: 40,
                                              color: Colors.red,
                                              onPressed: () {
                                                setState(() {
                                                  noofcondition--;
                                                });
                                              },
                                              icon:
                                                  Icon(Icons.exposure_minus_1),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                "$noofcondition",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 25,
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              iconSize: 40,
                                              color: Colors.green,
                                              onPressed: () {
                                                setState(() {
                                                  noofcondition++;
                                                });
                                              },
                                              icon: Icon(Icons.plus_one),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text("IS Responsive?"),
                                            ToggleSwitch(
                                              minWidth: 70.0,
                                              cornerRadius: 20.0,
                                              activeBgColors: [
                                                [Colors.green[800]!],
                                                [Colors.red[800]!]
                                              ],
                                              activeFgColor: Colors.white,
                                              inactiveBgColor: Colors.grey,
                                              inactiveFgColor: Colors.white,
                                              initialLabelIndex: 1,
                                              totalSwitches: 2,
                                              labels: ['True', 'False'],
                                              radiusStyle: true,
                                              onToggle: (index) {
                                                print('switched to: $index');
                                                if (index == 0) {
                                                  isReponsive = true;
                                                } else {
                                                  setState(() {
                                                    isReponsive = false;
                                                  });
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        ElevatedButton(
                                          child: const Text('Submit'),
                                          onPressed: ActiveBtnHandler,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff349EFF),
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.75,
                        MediaQuery.of(context).size.height * 0.07),
                  ),
                  child: Text(
                    widget.submitForApproval
                        ? "Approval Pending"
                        : "Send Approval ",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.inter().fontFamily,
                        color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
