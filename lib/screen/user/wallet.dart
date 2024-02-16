import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui_design/component/textstyles.dart';
import 'package:ui_design/screen/user/Home.dart';
import 'package:ui_design/screen/user/Profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _ClientDataState();
}

class _ClientDataState extends State<Wallet> {
  List TransactionDetail = [];
  String Credit = "";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getTransactionDetail();
    getUserDetail();
    setState(() {
      isLoading = false;
    });
  }

  getTransactionDetail() {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection("Transection")
        .where("empID", isEqualTo: userId)
      ..orderBy('date', descending: true).get().then((res) {
        List tempData = [];
        res.docs.forEach((element) {
          tempData.add(element.data());
        });
        setState(() {
          TransactionDetail = tempData;
        });
        print(TransactionDetail);
      });
  }

  getUserDetail() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(userId)
        .get()
        .then((response) {
      setState(() {
        Credit = response.data()!['Credit'].toString();
      });
    });
  }

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
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Text(
                    "Name",
                    style: txt20700(),
                  ),
                  Text("RS ${Credit}", style: txt20700()),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.purple,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Text(
                      "Project Statements",
                      style: txt20700(),
                    ),
                    // Divider(),
                    // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //   colcon(Colors.white),
                    //   Text("Widthdraw",style: txt15600()),
                    //   colcon(Colors.green),
                    //   Text("Avalible",style: txt15600()),
                    //   colcon(Colors.red),
                    //   Text("Rejected",style: txt15600()),
                    // ],),
                    // Divider(),

                    Divider(),
                    Column(
                      children: TransactionDetail.map(
                        (e) => Column(
                          children: [
                            containertransaction(
                              "${e['type']}",
                              "${e['TName']}",
                              "${e['TAmount']}",
                              e['date'] as Timestamp,
                            ),
                          ],
                        ),
                      ).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      /////////////////////////////////////////////////////////////
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: Color(0xff0047AB),
          borderRadius: BorderRadius.only(
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

//////////////////////////////////////////
Widget colcon(Color color) {
  return Container(
    height: 10,
    width: 10,
    decoration: BoxDecoration(
      color: color,
    ),
  );
}

Widget containertransaction(
    String status, String title, String amount, Timestamp date) {
  final firebaseTimestamp = date;
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    height: 65,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: status == "debit"
          ? Color.fromARGB(255, 241, 179, 98)
          : Color.fromARGB(255, 83, 187, 86),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: txt15700(),
              ),
              Row(
                children: [
                  Text(
                    "RS",
                    style: txt15600(),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    amount,
                    style: txt15600(),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text("Date: ", style: txt15600()),
              Text(firebaseTimestamp.toDate().toString(), style: txt15600()),
            ],
          ),
        ],
      ),
    ),
  );
}
