import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui_design/screen/Login.dart';
import 'package:ui_design/screen/user/Home.dart';
import 'package:ui_design/screen/user/wallet.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Logouthandler() {
      FirebaseAuth.instance.signOut().then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
        );
        print("object");
      });
    }

    return Scaffold(
      backgroundColor: Color(0xffEAF0F0),
      appBar: AppBar(
        title: Text("Client Profile"),
        leading: InkWell(
          onTap: () {},
          child: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // User Img
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-LpLfFkHIV6jkxMTs9vlK7gI8JbZM7cEmhmjCPXQfucl5BYYaYkFyPOONAVGJh03JBgQ&usqp=CAU "),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Name",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                Text("Name")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Father Name",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                Text("Father Name")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Joining Date",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                Text("Joining Date")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Age",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                Text("Age")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Date Of Birth",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                Text("Date Of Birth"),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Logouthandler();
                },
                child: Text("Logout")),
          ],
        ),
      ),
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
