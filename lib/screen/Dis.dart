import 'package:flutter/material.dart';
import 'package:ui_design/component/Upcoming.dart';

class Dis extends StatelessWidget {
  const Dis({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEAF0F0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Upcoming(
                    time: '3 Hr',
                    Difficulty: 'Difficulty : Easy',
                    discription:
                        'Make a page display about services for websites company with blue and red colors'),
                SizedBox(height: 5),
                Upcoming(
                    time: '3 Hr',
                    Difficulty: 'Difficulty : Easy',
                    discription:
                        'Make a page display about services for websites company with blue and red colors'),
                SizedBox(height: 5),
                Upcoming(
                    time: '3 Hr',
                    Difficulty: 'Difficulty : Easy',
                    discription:
                        'Make a page display about services for websites company with blue and red colors'),
                SizedBox(height: 5),
                Upcoming(
                    time: '3 Hr',
                    Difficulty: 'Difficulty : Easy',
                    discription:
                        'Make a page display about services for websites company with blue and red colors'),
                SizedBox(height: 5),
                Upcoming(
                    time: '3 Hr',
                    Difficulty: 'Difficulty : Easy',
                    discription:
                        'Make a page display about services for websites company with blue and red colors'),
                SizedBox(height: 5),
                Upcoming(
                    time: '3 Hr',
                    Difficulty: 'Difficulty : Easy',
                    discription:
                        'Make a page display about services for websites company with blue and red colors'),
                SizedBox(height: 5),
                Upcoming(
                    time: '3 Hr',
                    Difficulty: 'Difficulty : Easy',
                    discription:
                        'Make a page display about services for websites company with blue and red colors'),
                SizedBox(height: 5),
                Upcoming(
                    time: '3 Hr',
                    Difficulty: 'Difficulty : Easy',
                    discription:
                        'Make a page display about services for websites company with blue and red colors'),
                SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
