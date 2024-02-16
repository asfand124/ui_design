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
  'easy',
  'hard',
];
const List<String> leadby = <String>['huzi', 'Umer', "wajid", "Abdullah"];
const List<String> belongto = <String>[
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
  String belongtoValue = framework.first;

  TextEditingController titleController = TextEditingController();
  TextEditingController descrController = TextEditingController();
  int nooftime = 0;

  addTaskHandler() {
    try {
      FirebaseFirestore.instance.collection("Tasks").add({
        "Title": titleController.text,
        "Desc": descrController.text,
        "frameWork": frameworkValue,
        "difficulty": DifficultyValue,
        "belongsTo": belongtoValue,
        "LeadedBy": leadbyValue,
        "alottedTimeInHoure": nooftime,
        "appliedForApproval": false,
        "defaulted": false,
        "paid": false,
        "assignedTo": null,
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
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Task Title',
                label: Text("Task Title"),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            TextField(
              controller: descrController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Task Discription',
                  label: Text("Task Discription")),
            ),

            SizedBox(
              height: 10,
            ),
            Text("Time For Task"),
            SizedBox(
              height: 10,
            ),

            // timer for Hour set
            Row(
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
            Text("Which Platform"),

            // Framework dropdown
            DropdownMenu<String>(
              initialSelection: framework.first,
              onSelected: (String? value) {
                setState(() {
                  frameworkValue = value!;
                });
              },
              dropdownMenuEntries:
                  framework.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Difficulty"),
            SizedBox(
              height: 5,
            ),
            // Difficulty dropdown
            DropdownMenu<String>(
              initialSelection: Difficulty.first,
              onSelected: (String? value) {
                setState(() {
                  DifficultyValue = value!;
                });
              },
              dropdownMenuEntries:
                  Difficulty.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            Text("belong to"),
            SizedBox(
              height: 5,
            ),
            // belont to dropdown
            DropdownMenu<String>(
              initialSelection: belongto.first,
              onSelected: (String? value) {
                setState(() {
                  belongtoValue = value!;
                });
              },
              dropdownMenuEntries:
                  belongto.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Lead By"),
            SizedBox(
              height: 5,
            ),
            // Lead By dropdown
            DropdownMenu<String>(
              initialSelection: leadby.first,
              onSelected: (String? value) {
                setState(() {
                  leadbyValue = value!;
                });
              },
              dropdownMenuEntries:
                  leadby.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            // Submit button
            ElevatedButton(
              child: const Text('Submit'),
              onPressed: addTaskHandler,
            ),
          ],
        ),
      ),
    );
  }
}
