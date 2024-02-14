import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui_design/screen/Login.dart';

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
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Logouthandler();
                  },
                  child: Text("Logout")),
            )
          ],
        ),
      ),
    );
  }
}
