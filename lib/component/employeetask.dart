import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EmployeeTaskdetail extends StatefulWidget {
  final Map data;
  const EmployeeTaskdetail({super.key, required this.data});

  @override
  State<EmployeeTaskdetail> createState() => _EmployeeTaskdetailState();
}

class _EmployeeTaskdetailState extends State<EmployeeTaskdetail> {
  bool _haveATask = false;
  Map _taskDetails = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.data["activeTask"] != "") {
      print("object");
      getTaskData(widget.data["activeTask"]);
    }
  }

  getTaskData(id) {
    print(id);
    FirebaseFirestore.instance.collection("Tasks").doc(id).get().then(
      (doc) {
        print(doc.data());
        setState(() {
          _taskDetails = doc.data()!;
          _haveATask = true;
        });
        // ...
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: Column(
          children: [
            Container(
              color: Color(0xffDDDFFF),
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(10.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.person,
                      size: 30,
                    ),
                    Text(
                      "Employee Details",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            // Container(
            //   child: Image.network(
            //     "${data["imgUrl"]}",
            //   ),
            // )
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage("${widget.data["imgUrl"]}"),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 500,
              color: Color(0xffDDDFFF),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ReusableRow(
                        text1: "Name:", text2: "${widget.data["Name"]}"),
                    ReusableRow(
                        text1: "Task Status:",
                        text2:
                            "${widget.data["activeTask"] == "" ? "yes" : "no"}"),
                    ReusableRow(
                        text1: "Started Date:",
                        text2: "${widget.data["Name"]}"),
                    ReusableRow(
                        text1: "Deadline Date:",
                        text2: "${widget.data["Name"]}"),
                    ReusableRow(
                        text1: "Penalty:", text2: "${widget.data["Name"]}"),
                    Visibility(
                        visible: _haveATask,
                        child: Container(
                          child: Text("${_taskDetails['Title']}"),
                        ))
                  ],
                ),
              ),
            )
            // Text("${data["Name"]}" + " Details")
          ],
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String text1, text2;
  ReusableRow({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Text(
            text2,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
