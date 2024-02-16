import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_design/logics/User.dart';

class TaskDetail extends StatelessWidget {
  final Map<String, dynamic> taskDetails;
  const TaskDetail({super.key, required this.taskDetails});
  @override
  Widget build(BuildContext context) {
    startTask() {
      if (getUserCurrentTaskId() == "") {
        // submit some this
        print("Asign task : ${taskDetails['id']}");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('You Already Have A Task Running'),
        ));
      }
    }

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
        title: Text("${taskDetails["Title"]}"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Disprection',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  'Most apps contain several screens for displaying different types of information. For example, an app might have a screen that displays products. When the user taps the image of a product, a new screen displays Taskdetails about the product.Most apps contain several screens for displaying different types of information. For example, an app might have a screen that displays products. When the user taps the image of a product, a new screen displays Taskdetails about the product.\nMost apps contain several screens for displaying different types of information. For example, an app might have a screen that displays products. When the user taps the image of a product, a new screen displays Taskdetails about the product.'),
              SizedBox(
                height: 20,
              ),
              Text(
                'Time for task',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
              ),
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
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.grey,
                      size: 18,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '3 Hr',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.inter().fontFamily,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Difficulty',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
              ),
              Text(
                "Eassy",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.inter().fontFamily,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Tools',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
              ),
              Text('APIS calling'),
              SizedBox(
                height: 20,
              ),
             getUserType()=="admin"?SizedBox(): Center(
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
            ],
          ),
        ),
      ),
    );
  }
}
