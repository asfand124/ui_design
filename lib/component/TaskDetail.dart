import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_design/PageNavigation.dart';
import 'package:ui_design/adminnavigationpage.dart';
import 'package:ui_design/logics/User.dart';

class TaskDetail extends StatefulWidget {
  final Map<String, dynamic> taskDetails;
  final bool showTaskData;
  final bool showApprovalOptions;
  const TaskDetail(
      {super.key,
      required this.taskDetails,
      this.showTaskData = false,
      this.showApprovalOptions = false});

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  List PaymentDetails = [];
  String TimeFrame = "x1";
  num TotalPayable = 0;
  @override
  void initState() {
    super.initState();
    if (widget.showTaskData) {
      getPayments();
    }
  }

  updateUserActiveTask() {
    try {
      FirebaseFirestore.instance
          .collection("Users")
          .doc(getUserId())
          .update({'activeTask': widget.taskDetails['id']}).then((value) {
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
        print("Asign task : ${widget.taskDetails['id']}");
        try {
          FirebaseFirestore.instance
              .collection("Tasks")
              .doc(widget.taskDetails['id'])
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

  handleApproval(status) {
    FirebaseFirestore.instance
        .collection("Tasks")
        .doc(widget.taskDetails['id'])
        .update({
      "Completed": status,
      "submittedForApproval": status,
      "panelty": status ? 0 : 100,
    }).then((value) {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => AdminPageNavigation())));
    });
  }

  getPayments() {
    FirebaseFirestore.instance
        .collection("FrameWorks")
        .doc(widget.taskDetails['frameWork'])
        .get()
        .then((doc) {
      // print(doc.data());
      List<Map<String, dynamic>> temp = [];
      // Iterate through each key-value pair in doc.data()
      doc.data()!.forEach((key, value) {
        try {
          print(key);
          print(
            widget.taskDetails['TaskData'][key],
          );
          if (key == "responsiveness") {
            temp.add({
              "title": key,
              "calls": widget.taskDetails['TaskData'][key] ? "yes" : "no",
              "price": value,
              "total": value * (widget.taskDetails['TaskData'][key] ? 1 : 0)
            });
          } else if (key == "TimeFrame") {
            // Run Nothing For Now
          } else if (key == "Commit" || key == "TimeFrame") {
            // Run Nothing For Now
          } else if (key == "baseAmount") {
            temp.add(
                {"title": key, "calls": 1, "price": value, "total": value});
          } else {
            temp.add({
              "title": key,
              "calls": widget.taskDetails['TaskData']['No$key'],
              "price": value,
              "total": value * widget.taskDetails['TaskData']['No$key']
            });
          }
          num sumOfTotals = temp.fold(
              0, (previousValue, map) => previousValue + (map['total'] ?? 0));

          print(sumOfTotals);

          switch (widget.taskDetails['TaskData']['TimeFrame']) {
            case 'x1':
              sumOfTotals = sumOfTotals / 1;
              break;
            case 'x2':
              sumOfTotals = sumOfTotals / 2;

              break;
            case 'x3':
              sumOfTotals = sumOfTotals / 4;

              break;
            case 'x4':
              sumOfTotals = 0;
              break;
            default:
          }

          setState(() {
            PaymentDetails = temp;
            TotalPayable = sumOfTotals - widget.taskDetails['panelty'];
          });
        } catch (e) {
          print(e);
        }
      });
      print(temp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdddaff),
      appBar: AppBar(
        backgroundColor: Color(0xffdddaff) ,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          "${widget.taskDetails["Title"]}",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                 padding: EdgeInsets.only(left: 15),
              height: MediaQuery.of(context).size.height*0.44 ,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                          color: Colors.white,

              ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                height: 10,
              ),
                    Text(
                'Discription',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700,
                fontFamily: GoogleFonts.karma().fontFamily
),
              ),

              SizedBox(
                height: 10,
              ),
              Text('${widget.taskDetails['Desc']}'),
              SizedBox(
                height: 10,
              ),
               Text(
                'Detail Discription',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700,
                fontFamily: GoogleFonts.karma().fontFamily
),
              ),
                 SizedBox(
                      height: 20,
                    ),
                    Text('He said this while launching the Final Year Design Project Financing held at University of Agriculture, Faisalabad. Pakistan Engineering Council has funded 593 projects for 2023-24 among students of more than 100 universities across the country.',
               ),
              
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
             Container(
              padding: EdgeInsets.only(left: 15),
              height: MediaQuery.of(context).size.height*0.44,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                          color: Colors.white,

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                    Center(
                      child: Text(
                                      'Frame work',
                                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600,
                                      fontFamily: GoogleFonts.karma().fontFamily),
                                    ),
                    ),
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
                '${widget.taskDetails['alottedTimeInHours']} Hr',
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
                '${widget.taskDetails['difficulty']}',
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
              Text('${widget.taskDetails['frameWork']}'),
              SizedBox(
                height: 10,
              ),
                ],
              ),
             ),
                SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 15),
              height: MediaQuery.of(context).size.height*0.43,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                          color: Colors.white,

              ),


                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     SizedBox(
                    height: 10,
                  ),
                    Center(
                      child: Text(
                                      'Project Detail',
                                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600,
                                      fontFamily: GoogleFonts.karma().fontFamily),
                                    ),
                    ),
                       SizedBox(
                height: 10,
              ),
                    Text(
                'Project',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
              ),
              Text('${widget.taskDetails['belongsTo']}'),
              SizedBox(
                height: 10,
              ),
              Text(
                'Leader',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
              ),
              Text('${widget.taskDetails['leadedBy']}'),
              SizedBox(
                height: 10,
              ),
              Text(
                'Createed At',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
              ),
              Text('${widget.taskDetails['createdAt'].toDate()}'),
              SizedBox(
                height: 20,
              ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
//               Container(
//                  padding: EdgeInsets.only(left: 15),
//               height:MediaQuery.of(context).size.height*0.33,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                           color: Colors.white,

//               ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                       SizedBox(
//                       height: 10,
//                     ),
//                      Text(
//                 'Detail Discription',
//                 style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700,
//                 fontFamily: GoogleFonts.karma().fontFamily
// ),
//               ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Text('He said this while launching the Final Year Design Project Financing held at University of Agriculture, Faisalabad. Pakistan Engineering Council has funded 593 projects for 2023-24 among students of more than 100 universities across the country.',
//                 style: TextStyle( fontWeight: FontWeight.w700,
//                 fontFamily: GoogleFonts.karma().fontFamily
// ),),

//                   ],
//                 ),
//               ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                  visible: widget.showTaskData,
                  child: Column(
                    children: [
                      Text(
                        'Time Frame',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w600),
                      ),
                      Text('${widget.taskDetails["TaskData"]['TimeFrame']}'),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'GitHub Comit Name',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w600),
                      ),
                      Text('${widget.taskDetails["TaskData"]['Commit']}'),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'other Panelty',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w600),
                      ),
                      Text("${widget.taskDetails['panelty']}"),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Total on the bases of timeframe',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w600),
                      ),
                      Text('$TotalPayable'),
                      SizedBox(
                        height: 20,
                      ),
                      ...PaymentDetails.map((e) => Text(
                          "${e['title']} ${e['calls']} ${e['price']} ${e['total']}")),
                    ],
                  )),
              widget.showApprovalOptions
                  ? Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            handleApproval(true);
                          },
                          child: Text("Aprove"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            handleApproval(false);
                          },
                          child: Text("Reject"),
                        ),
                      ],
                    )
                  : getUserType() == "admin"
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
                        SizedBox(
                          height: 20,
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
