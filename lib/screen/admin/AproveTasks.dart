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
      backgroundColor: Color(0xffDDDFFF),
      body: Column(
        children: unApprovedTasks
            .map((task) => ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TaskDetail(
                            taskDetails: task,
                            showTaskData: true,
                            showApprovalOptions: true,
                          )));
                },
                child: Text("${task['Title']}")))
            .toList(),
      ),
    );
  }
}
