import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_design/component/RecentTask.dart';
import 'package:ui_design/component/RecentTaskDetail.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
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
          tempData.add({...element.data(), "id": element.id});
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
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 20, top: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 15, top: 15),
            height: MediaQuery.of(context).size.height * 0.26,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Card Balance',
                  style: TextStyle(
                      color: Color(0xff979797), fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'PKR ${Credit}',
                  style: TextStyle(
                    color: const Color(0xff349EFF),
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Task Activity (${TransactionDetail.length})',
                style: TextStyle(
                  color: const Color(0xff25272B),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 376,
            child: SingleChildScrollView(
              child: Column(
                children: TransactionDetail.map(
                  (e) => RecentTask(
                      ontap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  RecentTaskDetail(id: e["taskId"])),
                        );
                      },
                      price: "${e['TAmount']}",
                      title: "${e['TName']}",
                      type: "${e['type']}",
                      time: e['date'] as Timestamp),
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
