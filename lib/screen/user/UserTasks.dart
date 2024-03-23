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
    return Scaffold(
      appBar: AppBar(title: Text("Previous Tasks"),),
      body:  Padding(
      padding: const EdgeInsets.only(left: 15, right: 20, top: 20),
      child: Column(
        children: [
           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
         SizedBox(height: 30,),
          Container(
            padding: const EdgeInsets.only(left: 15, top: 15),
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Previous Tasks(0)',
                  style: TextStyle(
                      color: Color(0xff979797), fontWeight: FontWeight.w600),
                ),

               Icon(Icons.refresh)
               
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
         
          const SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
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
    )
 ,);
   
  }
}

Widget taskCard(context, String title) {
  return Container(
    decoration: BoxDecoration(    color: Colors.deepPurpleAccent,
      borderRadius: BorderRadius.circular(10)),
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: EdgeInsets.only(bottom: 10),

    child: Center(child: Text(title,style: TextStyle(color: Colors.white),)),
  );
}
