import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentTask extends StatelessWidget {
  final String title;
  final String subTitle;
  final String price;
  final String curency;

  const RecentTask(
      {super.key,
      required this.price,
      required this.subTitle,
      required this.title,
      required this.curency});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${title}${subTitle}',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xff25272B),
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
            Text('${price}${curency}',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xffEF1717),
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),),
          ],
        ),
      ),
    );
  }
}
