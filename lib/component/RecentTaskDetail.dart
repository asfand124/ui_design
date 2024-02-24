import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentTaskDetail extends StatelessWidget {
  // final String title;
  // final String type;
  // final String Status;
  const RecentTaskDetail({
    super.key,
    // required this.Status,
    // required this.title,
    // required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDDDAFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 15, bottom: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Title',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff25272B),
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                          Text(
                            'Ui',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xff349EFF),
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                          Text(
                            'Type',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff25272B),
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                          Text(
                            'Debit/Creadit',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xff349EFF),
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                          Text(
                            'Status',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff25272B),
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                          Text(
                            'Defult/ Paid',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xff349EFF),
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //-----------------------------second container----------------------------
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 15, bottom: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'API Callings',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff25272B),
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                              Text(
                                '100PKR',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff349EFF),
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '5',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff25272B),
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                              Text(
                                '100x',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff25272B),
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                              Text(
                                '50PKR',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff349EFF),
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Conditions',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff25272B),
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                              Text(
                                '100PKR',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff349EFF),
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '2',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff25272B),
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                              Text(
                                '100x',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff25272B),
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                              Text(
                                '200PKR',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff349EFF),
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  //--------------------------thried container------------------------------------
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 15, bottom: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Time frame',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff25272B),
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                              Text(
                                '1x hr',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff349EFF),
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Extra Panolty',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff25272B),
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                              Text(
                                '100PKR',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff349EFF),
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'TOTAL',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff25272B),
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                             
                              Text(
                                '500PKR',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff349EFF),
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
