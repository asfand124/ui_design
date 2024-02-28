import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ui_design/screen/admin/AdminHome.dart';

const List<String> framework = <String>[
  'Flutter',
  'React',
  'Wordpress',
  'Figma'
];
const List<String> Difficulty = <String>[
  'Easy',
  'Medium',
  'Hard',
];
List<Map> leadby = <Map>[
  {"name": "huzaifa", "id": "123456"},
  {"name": "huzaifa", "id": "123456"},
  {"name": "huzaifa", "id": "123456"},
  {"name": "huzaifa", "id": "123456"},
];
List<String> projectName = <String>[
  'settle loan',
  'the tour',
  'leads',
];

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String frameworkValue = framework.first;
  String DifficultyValue = framework.first;
  String leadbyValue = framework.first;
  String projectNameValue = framework.first;

  TextEditingController titleController = TextEditingController();
  TextEditingController descrController = TextEditingController();
  int nooftime = 0;
  @override
  void initState() {
    super.initState();
    getProjectsName();
    getEmployeeList();
  }

  getProjectsName() {
    FirebaseFirestore.instance.collection("Projects").get().then(
      (querySnapshot) {
        List<String> tempData = [];
        querySnapshot.docs.forEach((doc) {
          print(doc.id);
          tempData.add(doc.id);
        });
        setState(() {
          projectName = tempData;
        });
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  getEmployeeList() {
    FirebaseFirestore.instance
        .collection("Users")
        .where('Type', isEqualTo: "user")
        .get()
        .then(
      (querySnapshot) {
        List<Map> tempData = [];
        querySnapshot.docs.forEach((doc) {
          tempData.add({"name": doc.data()['Name'], "id": doc.id});
        });
        setState(() {
          leadby = tempData;
        });
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  addTaskHandler() {
    try {
      FirebaseFirestore.instance.collection("Tasks").add({
        "Title": titleController.text,
        "Desc": descrController.text,
        "frameWork": frameworkValue,
        "difficulty": DifficultyValue,
        "belongsTo": projectNameValue,
        "leaderID": leadbyValue,
        "alottedTimeInHours": nooftime,
        "appliedForApproval": false,
        "defaulted": false,
        "paid": false,
        "assignedTo": null,
        "assignedAt": null,
        "Completed": false,
        "createdAt": FieldValue.serverTimestamp(),
      }).then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => AdminHome())));
      });
    } on FirebaseException catch (e) {
      print(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Add Task")),
      ),
      backgroundColor: Color(0xfffDDDFFF),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, right: 10, left: 10, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Task Title:",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Task Title',
                    label: Text("Task Title"),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Task Description:",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: descrController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Task Discription',
                    label: Text("Task Discription"),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Text(
                  "Time For Task",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),

                // timer for Hour set
                Container(
                  width: double.infinity,
                  // MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        iconSize: 40,
                        color: Colors.red,
                        onPressed: () {
                          setState(() {
                            nooftime--;
                          });
                        },
                        icon: Icon(Icons.exposure_minus_1),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Text(
                          "$nooftime'hr",
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
                            nooftime++;
                          });
                        },
                        icon: Icon(Icons.plus_one),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Text(
                  "Which Platform",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                // Framework dropdown
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  //  MediaQuery.of(context).size.width * 0.5,
                  child: DropdownMenu<String>(
                    width: MediaQuery.of(context).size.width * 0.5,
                    initialSelection: framework.first,
                    onSelected: (String? value) {
                      setState(() {
                        frameworkValue = value!;
                      });
                    },
                    dropdownMenuEntries: framework
                        .map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Task Level",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                // Difficulty dropdown
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: DropdownMenu<String>(
                    width: MediaQuery.of(context).size.width * 0.5,
                    initialSelection: Difficulty.first,
                    onSelected: (String? value) {
                      setState(() {
                        DifficultyValue = value!;
                      });
                    },
                    dropdownMenuEntries:
                        Difficulty.map<DropdownMenuEntry<String>>(
                            (String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Belong to",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                // belont to dropdown
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  color: Colors.white,
                  child: DropdownMenu<String>(
                    width: MediaQuery.of(context).size.width * 0.5,
                    initialSelection: projectName.first,
                    onSelected: (String? value) {
                      setState(() {
                        projectNameValue = value!;
                      });
                    },
                    dropdownMenuEntries: projectName
                        .map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Lead By",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                // Lead By dropdown
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  color: Colors.white,
                  child: DropdownMenu<String>(
                    width: MediaQuery.of(context).size.width * 0.5,
                    initialSelection: leadby.first["name"],
                    onSelected: (String? value) {
                      setState(() {
                        leadbyValue = value!;
                      });
                    },
                    dropdownMenuEntries:
                        leadby.map<DropdownMenuEntry<String>>((employee) {
                      return DropdownMenuEntry<String>(
                          value: employee['id'], label: employee["name"]);
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Submit button
                ElevatedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: addTaskHandler,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff349EFF),
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.95,
                        MediaQuery.of(context).size.height * 0.07),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
