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
  bool _isloading = true;
  Map _taskDetails = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.data["activeTask"] != "") {
      print("object");
      getTaskData(widget.data["activeTask"]);
    } else {
      setState(() {
        _isloading = false;
      });
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
          _isloading = false;
          print(_isloading);
        });
        // ...
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _isloading
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            backgroundColor: Color(0xfffDDDFFF),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(10.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              size: 30,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01,
                            ),
                            Text(
                              "Employee Details",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
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
                      height: MediaQuery.of(context).size.height * 0.37,
                      color: Colors.white,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 20),
                        child: Column(
                          children: [
                            ReusableRow(
                                text1: "Name:",
                                text2: "${widget.data["Name"]}"),
                            ReusableRow(
                                text1: "Task Status:",
                                text2:
                                    "${widget.data["activeTask"] == "" ? "No Task" : "Assigned"}"),
                            widget.data["activeTask"] != ""
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: Column(
                                      children: [
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.spaceBetween,
                                        //   children: [
                                        //     Text(
                                        //       "Task Name",
                                        //       style: TextStyle(
                                        //           fontSize: 17,
                                        //           fontWeight: FontWeight.bold),
                                        //     ),
                                        //     Text(
                                        //       "${_taskDetails["Title"]}",
                                        //       style: TextStyle(
                                        //           fontSize: 17,
                                        //           fontWeight: FontWeight.bold),
                                        //     ),
                                        //   ],
                                        // ),
                                        ReusableRow(
                                            text1: "Task Name",
                                            text2: "${_taskDetails['Title']}"),
                                        ReusableRow(
                                            text1: "Task Description",
                                            text2: "${_taskDetails['Desc']}"),
                                        ReusableRow(
                                            text1: "Task Time",
                                            text2:
                                                "${_taskDetails['alottedTimeInHours']}" +
                                                    " Hours"),
                                        ReusableRow(
                                            text1: "Task  Amout",
                                            text2:
                                                "${_taskDetails['paid'] == false ? "Unpaid" : "Paid"}"),

                                        ReusableRow(
                                            text1: "Task Level",
                                            text2:
                                                "${_taskDetails['difficulty']}"),
                                        ReusableRow(
                                            text1: "Frame Work",
                                            text2:
                                                "${_taskDetails['frameWork']}"),
                                      ],
                                    ),
                                  )
                                : Divider(),

                            // widget.data["activeTask"] == ""
                            //       ? Visibility(
                            //           visible: false,
                            //           child: Container(
                            //             child: Text("${_taskDetails['Title']}"),
                            //           ))
                            //       : Visibility(
                            //           visible: _haveATask,
                            //           child: Container(
                            //             child: Text("${_taskDetails['Title']}"),
                            //           ))
                            // ReusableRow(
                            //     text1: "Started Date:",
                            //     text2: "${widget.data["Name"]}"),
                            // ReusableRow(
                            //     text1: "Deadline Date:",
                            //     text2: "${widget.data["Name"]}"),
                            // ReusableRow(
                            //     text1: "Penalty:", text2: "${widget.data["Name"]}"),

                            // Visibility(
                            //     visible: _haveATask,
                            //     child: Container(
                            //       child: Text("${_taskDetails['Title']}"),
                            //     )
                            //     )
                          ],
                        ),
                      ),
                    )
                    // Text("${data["Name"]}" + " Details")
                  ],
                ),
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text1,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Text(
                text2,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
