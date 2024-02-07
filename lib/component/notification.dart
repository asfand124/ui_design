import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class notification extends StatelessWidget {
  final notifi;
  const notification({super.key, required this.notifi});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: Color(0xffFFC604),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
          child: Text(
        notifi,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
      )),
    );
  }
}
