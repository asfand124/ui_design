import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'TaskDetail.dart';
import '../screen/user/Nextpage.dart';
import 'notification.dart';

class UpcomingTasks extends StatefulWidget {
  final List<Map<String, dynamic>> dataStream;

  UpcomingTasks({super.key, required this.dataStream});

  @override
  State<UpcomingTasks> createState() => _UpcomingTasksState();
}

class _UpcomingTasksState extends State<UpcomingTasks> {
  // final List<Map<String, dynamic>> availableTasks = dataStream;

  getData() {
    print(widget.dataStream);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Available Tasks ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: GoogleFonts.inter().fontFamily,
                        ),
                      ),
                      // ----------------notification page--------------------
                    ],
                  ),
                  //------------------------------next page---------------------------
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Dis(),
                        ),
                      );
                    },
                    child: notification(notifi: "${widget.dataStream.length}"),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          // cARDS
          SizedBox(
            height: 300,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.dataStream.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              TaskDetail(taskDetails: widget.dataStream[index]),
                        ),
                      );
                    },
                    child: Material(
                      borderOnForeground: true,
                      elevation: 10,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 280,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 207, 207, 207),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xffF1F0FE),
                                      minimumSize: Size(120, 35),
                                      elevation: 0),
                                  child: Text(
                                      "${widget.dataStream[index]["frameWork"]}")),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${widget.dataStream[index]["Title"]}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("${widget.dataStream[index]["Desc"]}"),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Colors.black,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Icon(
                                          Icons.timer,
                                          color: Colors.grey,
                                          size: 18,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "${widget.dataStream[index]["alottedTimeInHours"]} Hrs",
                                        // "Time",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          fontFamily:
                                              GoogleFonts.inter().fontFamily,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                      onPressed: getData,
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xff349EFF),
                                          minimumSize: Size(120, 30),
                                          elevation: 0),
                                      child: Text(
                                        "${widget.dataStream[index]["difficulty"]}",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            fontFamily:
                                                GoogleFonts.inter().fontFamily,
                                            color: Colors.white),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 30),
                                child: Container(
                                  height: 40,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Leader',
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: GoogleFonts.inter()
                                                    .fontFamily,
                                              ),
                                            ),
                                            Text(
                                              '${widget.dataStream[index]["leadedBy"]}',
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: GoogleFonts.inter()
                                                    .fontFamily,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 20,
                                          width: 1,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'project',
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: GoogleFonts.inter()
                                                    .fontFamily,
                                              ),
                                            ),
                                            Text(
                                              '${widget.dataStream[index]["belongsTo"]}',
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: GoogleFonts.inter()
                                                    .fontFamily,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
