import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_design/component/RecentTask.dart';
import 'package:ui_design/component/RecentTaskDetail.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 20,top: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
               padding: EdgeInsets.only(left: 15,top: 15),
              height: MediaQuery.of(context).size.height*0.26,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
        
        
              ),
              child: 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  Text('Card Balance',style: TextStyle(
                    color: Color(0xff979797),fontWeight: FontWeight.w600
                  ),),
                  SizedBox(
                    height: 15,
                  ),
                  Text('PKR4 000.0',style: TextStyle(
                    color: Color(0xff349EFF),fontSize: 30,fontWeight: FontWeight.w600,fontFamily: GoogleFonts.poppins().fontFamily,
                  ),),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent Task Activity (5)',style: TextStyle(
                    color: Color(0xff25272B),fontSize: 15,fontWeight: FontWeight.w600,fontFamily: GoogleFonts.poppins().fontFamily,
                  ),),
                Text('See All',style: TextStyle(
                    color: Color(0xff25272B),fontSize: 15,fontWeight: FontWeight.w400,fontFamily: GoogleFonts.poppins().fontFamily,
                  ),),
        
              ],
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                  Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>RecentTaskDetail()
                        ),
                      );
              },
              child: RecentTask(price: '200', subTitle: '/Email', title: 'Ui',curency: ' PKR',)),
             SizedBox(
              height: 10,
            ),
            RecentTask(price: '200', subTitle: '/Email', title: 'Ui',curency: ' PKR',),
             SizedBox(
              height: 10,
            ),
            RecentTask(price: '200', subTitle: '/Email', title: 'Ui',curency: ' PKR',),
             SizedBox(
              height: 10,
            ),
            RecentTask(price: '200', subTitle: '/Email', title: 'Ui',curency: ' PKR',),
             SizedBox(
              height: 10,
            ),
            RecentTask(price: '200', subTitle: '/Email', title: 'Ui',curency: ' PKR',),
          ],
        ),
      ),
    );
  }
}