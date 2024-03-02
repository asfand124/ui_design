import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_design/component/RecentTask.dart';
import 'package:ui_design/component/RecentTaskDetail.dart';

class userTasks extends StatefulWidget {
  const userTasks({super.key});

  @override
  State<userTasks> createState() => _userTasksState();
}

class _userTasksState extends State<userTasks> {
  List _paymentPending = [];
  List _paymentdefaulted = [];
  bool _isPaymentPendingScreen = true;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getUserTasks();
  }

  getUserTasks() {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection("Tasks")
        .where("assignedTo", isEqualTo: userId)
        .where("Completed", isEqualTo: true)
        .where("paid", isEqualTo: false)
        .orderBy('submittedAt', descending: true)
        .get()
        .then((res) {
      List tempData1 = [];
      List tempData2 = [];
      res.docs.forEach((element) {
        print(element.data()['defaulted']);
        if (element.data()['defaulted']) {
          tempData1.add({...element.data(), "id": element.id});
        } else {
          tempData2.add({...element.data(), "id": element.id});
        }
      });
      setState(() {
        _paymentPending = tempData2;
        _paymentdefaulted = tempData1;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 20, top: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 15, top: 15),
            height: MediaQuery.of(context).size.height * 0.26,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Payment Pending tasks',
                  style: TextStyle(
                      color: Color(0xff979797), fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '10',
                  style: TextStyle(
                    color: const Color(0xff349EFF),
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isPaymentPendingScreen = true;
                    });
                  },
                  child: Text("Pending")),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isPaymentPendingScreen = false;
                    });
                  },
                  child: Text("Defaulted"))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 376,
            child: SingleChildScrollView(
              child: Column(children: [
                Visibility(
                  visible: _isPaymentPendingScreen,
                  child: Column(
                    children: _paymentPending
                        .map((e) => taskCard(context, e["Title"]))
                        .toList(),
                  ),
                ),
                Visibility(
                  visible: !_isPaymentPendingScreen,
                  child: Column(
                    children: _paymentdefaulted
                        .map((e) => taskCard(context, e["Title"]))
                        .toList(),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

Widget taskCard(context, String title) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 100,
    margin: EdgeInsets.only(bottom: 10),
    color: Colors.deepPurpleAccent,
    child: Text(title),
  );
}
