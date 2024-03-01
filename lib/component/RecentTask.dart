import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentTask extends StatelessWidget {
  final String title;

  final String price;
  final String type;
  final Timestamp time;
  final Function ontap;

  const RecentTask(
      {super.key,
      required this.price,
      required this.title,
      required this.time,
      required this.ontap,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          ontap();
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${title}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xff25272B),
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                Text(
                  '${price} PKR',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: type == "debit"
                        ? Color.fromARGB(255, 5, 255, 118)
                        : Color.fromARGB(255, 255, 0, 0),
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              ],
            ),
            Text(
              "${time.toDate().day} / ${time.toDate().month} / ${time.toDate().year} ",
            ),
          ],
        ),
      ),
    );
  }
}
