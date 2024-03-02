import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ui_design/Authentication/Login.dart';
import 'package:ui_design/logics/User.dart';
import 'package:ui_design/screen/user/Home.dart';
import 'package:ui_design/screen/user/wallet.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Map<String, dynamic> userDetails = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  getUserData() {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(getUserId())
        .get()
        .then((res) {
      setState(() {
        userDetails = res.data()!;
      });
    });
  }

  Logouthandler() {
    FirebaseAuth.instance.signOut().then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
      print("object");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          top: 90,
          left: 25,
          right: 25,
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Center(
                        child: Text(
                          "${userDetails["Name"]}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.person_2_rounded,
                                size: 20,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Father name',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text('Shaber Ahmed'),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.join_inner,
                                size: 20,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Joining Date',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text('12-2-2024'),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.person_4_outlined,
                                size: 20,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Age',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text('22'),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.lightbulb_circle,
                                size: 20,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('skills',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text('flutter'),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.mail_outline,
                                size: 20,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Email',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text('xyz@gmail.com'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: 30,
            right: 0,
            left: 25,
            child: Container(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blue,
              ),
            )),
            
        Positioned(
          bottom: 90,
          left: 80,
          child: Container(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff821DFB),
                  minimumSize: Size(220, 50),
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
