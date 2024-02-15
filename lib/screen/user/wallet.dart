import 'package:flutter/material.dart';
import 'package:ui_design/component/textstyles.dart';
import 'package:ui_design/screen/user/Home.dart';
import 'package:ui_design/screen/user/Profile.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _ClientDataState();
}

class _ClientDataState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [            
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.purple,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "SoftXion Bank",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.notifications, color: Colors.white),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                       const Icon(Icons.logout, color: Colors.white)
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10)),
              child:  Column(
                children: [
                  Text(
                    "Name",
                     style: txt20700(),
                  ),
                  Text(
                    "RS 1000",
                    style: txt20700()
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                color: Colors.purple,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Text(
                      "Project Statements",
                      style: txt20700(),),
                    Divider(),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      colcon(Colors.white),
                      Text("Widthdraw",style: txt15600()),
                      colcon(Colors.green),
                      Text("Avalible",style: txt15600()),
                      colcon(Colors.red),
                      Text("Rejected",style: txt15600()),
                    ],),
                    Divider(),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "WithDraw",
                              style: txt15700(),
                            ),
                            Text(
                              "RS 1000",
                              style: txt15700(),
                            ),
                          ],
                        ),
                        Row(
                        
                        children: [
                          Text(
                            "Date: ",
                            style: txt15600()
                          ),
                          Text(
                            "02 Feburary 2024",
                            style: txt15600()
                                
                          ),
                        ],
                      ),
                      ],
                    ),
                    Divider(),
                     Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "WithDraw",
                              style: txt15700(),
                            ),
                            Text(
                              "RS 1000",
                              style: txt15700(),
                            ),
                          ],
                        ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Project Name",
                              style: txt15700(),
                            ),
                            Text(
                              "RS 1000",
                              style: txt15600green(),
                            ),
                          ],
                        ),
                        Row(
                        
                        children: [
                          Text(
                            "Date: ",
                            style: txt15600()
                          ),
                          Text(
                            "02 Feburary 2024",
                            style: txt15600()
                                
                          ),
                        ],
                      ),
                      ],
                    ),
                    Divider(),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Project Name",
                              style: txt15700(),
                            ),
                            Text(
                              "RS 1000",
                              style: txt15600red(),
                            ),
                          ],
                        ),
                        Row(
                        
                        children: [
                          Text(
                            "Date: ",
                            style: txt15600()
                          ),
                          Text(
                            "02 Feburary 2024",
                            style: txt15600()
                                
                          ),
                        ],
                      ),
                      ],
                    ),
                    Divider()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      /////////////////////////////////////////////////////////////
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xff0047AB),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              },
              child: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ),
                );
              },
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Wallet(),
                  ),
                );
              },
              child: Icon(
                Icons.wallet,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
Widget colcon(
  Color color
){
  return Container(
    height: 10,
              width:10,
              decoration:  BoxDecoration(
                color: color,
              ),);
}