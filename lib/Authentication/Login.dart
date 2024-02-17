import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:ui_design/screen/Home.dart';
import 'package:ui_design/Authentication/Signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ui_design/PageNavigation.dart';
import 'package:ui_design/adminnavigationpage.dart';
import 'package:ui_design/screen/admin/AdminHome.dart';
import 'package:ui_design/screen/user/Home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

TextEditingController _email = TextEditingController();
TextEditingController _pass = TextEditingController();

class _LoginState extends State<Login> {
  @override
  void initState() {
    // checkuser();
  }

  NavigateUser(String title) {
    switch (title) {
      case "user":
        {
          Navigator.of(context).push(
              MaterialPageRoute(builder: ((context) => PageNavigation())));
          break;
        }

      case "admin":
        {
          Navigator.of(context).push(
              MaterialPageRoute(builder: ((context) => AdminPageNavigation())));
          break;
        }
    }
  }

  Signin() async {
    EasyLoading.show(status: "Loading...");
    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email.text, password: _pass.text)
          .then((res) {
        getUserType(res.user?.uid);
        EasyLoading.dismiss();
      });
    } on FirebaseAuthException catch (e) {
      EasyLoading.showToast(e.code);
    } catch (e) {
      EasyLoading.showToast(e.toString());
    }
  }

  getUserType([String? uid]) {
    final docRef = FirebaseFirestore.instance.collection("Users").doc(uid);
    docRef.get().then(
      (doc) {
        Map<String, dynamic> userType = doc.data()!;
        final type = userType["Type"];
        NavigateUser(type);
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Your email',
              ),
              controller: _email,
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Your pass',
              ),
              controller: _pass,
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: Signin,
              child: Text("Login"),
            ),
            // ElevatedButton(onPressed: Signup, child: Text("signup"))
          ],
        ),
      ),
    );
  }
}
