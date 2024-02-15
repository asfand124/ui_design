import 'package:flutter/material.dart';
import 'package:ui_design/component/Upcoming.dart';
import 'package:ui_design/screen/user/Detail.dart';

class Dis extends StatelessWidget {
  const Dis({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      backgroundColor: Color(0xffEAF0F0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Detail(),
                      ),
                    );
                  },
                  child: Upcoming(
                      frameWork: "flutter",
                      title: "LoginPage",
                      time: '3 Hr',
                      Difficulty: 'Difficulty : Easy',
                      discription:
                          'Make a page display about services for websites company with blue and red colors'),
                ),
                SizedBox(height: 5),
                SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
