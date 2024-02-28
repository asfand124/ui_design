import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ui_design/component/TaskDetail.dart';

class AproveTaks extends StatefulWidget {
  const AproveTaks({super.key});

  @override
  State<AproveTaks> createState() => _AproveTaksState();
}

class _AproveTaksState extends State<AproveTaks> {
  List unApprovedTasks = [{}];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllUnApprovedTasks();
  }

  getAllUnApprovedTasks() async {
    await FirebaseFirestore.instance
        .collection("Tasks")
        .where("paid", isEqualTo: false)
        .where("submittedForApproval", isEqualTo: true)
        .where("defaulted", isEqualTo: false)
        .get()
        .then((response) {
      List<Map<String, dynamic>> tempRecords = [];
      response.docs.forEach((element) {
        print(element.id);
        tempRecords.add({...element.data(), "id": element.id});
      });
      setState(() {
        unApprovedTasks = tempRecords;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Task's For Graded",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: Color(0xffDDDFFF),
      body: Column(
        children: unApprovedTasks
            .map((task) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TaskDetail(
                                    taskDetails: task,
                                    showTaskData: true,
                                    showApprovalOptions: true,
                                  )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          height: MediaQuery.of(context).size.height * 0.08,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "${task['Title']}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  "${task['paid'] == false ? "Unpaid" : "Paid"}"),
                              Text(
                                "${task['belongsTo']}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      )
                      //  ElevatedButton(
                      //     onPressed: () {
                      //       Navigator.of(context).push(MaterialPageRoute(
                      //           builder: (context) => TaskDetail(
                      //                 taskDetails: task,
                      //                 showTaskData: true,
                      //                 showApprovalOptions: true,
                      //               )));
                      //     },
                      //     child: Text("${task['Title']}")),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
