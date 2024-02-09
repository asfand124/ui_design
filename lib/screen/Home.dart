import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_design/component/Task.dart';
import 'package:ui_design/component/Upcoming.dart';
import 'package:ui_design/component/notification.dart';
import 'package:ui_design/screen/Nextpage.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEAF0F0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi, Huzaifa Tawab',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontFamily: GoogleFonts.inter().fontFamily,
                              ),
                            ),
                            Text(
                              'Are you ready to get back to work?',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                fontFamily: GoogleFonts.inter().fontFamily,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Color(0xffFB6565),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //-------------------component----------------------------
                SizedBox(
                  height: 20,
                ),
                Task(
                    start: '10:50 AM',
                    date: '20',
                    month: ' may',
                    year: ' 2020',
                    endtime: '2:50:00'),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.88,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'UPCOMING ',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontFamily: GoogleFonts.inter().fontFamily,
                              ),
                            ),
                            // ----------------notification page--------------------
                            notification(notifi: '3'),
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
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Text(
                                  '...',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    child: Row(
                      children: [
                        Upcoming(
                            time: '3 Hr',
                            Difficulty: 'Difficulty : Hard',
                            discription:
                                'Make a page display about services for websites company with blue and red colors'),
                        SizedBox(width: 5),
                        Upcoming(
                            time: '3 Hr',
                            Difficulty: 'Difficulty : Easy',
                            discription:
                                'Make a page display about services for websites company with blue and red colors'),
                        SizedBox(width: 5),
                        Upcoming(
                            time: '3 Hr',
                            Difficulty: 'Difficulty : Medium',
                            discription:
                                'Make a page display about services for websites company with blue and red colors'),
                        SizedBox(width: 5),
                        Upcoming(
                            time: '3 Hr',
                            Difficulty: 'Difficulty : Easy',
                            discription:
                                'Make a page display about services for websites company with blue and red colors'),
                        SizedBox(width: 5),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
