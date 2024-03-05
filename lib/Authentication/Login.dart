import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:ui_design/screen/Home.dart';
import 'package:ui_design/Authentication/Signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ui_design/PageNavigation.dart';
import 'package:ui_design/adminnavigationpage.dart';
import 'package:ui_design/logics/SharedPreff.dart';
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
    checkUser();
  }

  checkUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String? _userType = await getString("userType");
      print(_userType);
      if (_userType != null) {
        NavigateUser(_userType);
      }
    }
  }

  NavigateUser(String title) {
    putString("userType", title);
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
      backgroundColor: Color(0xffDDDAFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/Logo.png'),
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  ' Welcome Back',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.poppins().fontFamily),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  ' Hey good to see you again',
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: GoogleFonts.cambo().fontFamily),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            //  prefix: Icon(Icons.email,color: Colors.black,),
                            hintText: 'Enter Your email',
                            hintStyle: TextStyle(
                                color: Color(0xff349EFF), fontSize: 15),
                            label: Text('Email')),
                        controller: _email,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter Your pass',
                          hintStyle:
                              TextStyle(color: Color(0xff349EFF), fontSize: 15),
                          label: Text('Password'),
                        ),
                        controller: _pass,
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: Signin,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff821DFB),
                            minimumSize: Size(220, 50),
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        child: Text(
                          "Authenticate",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      // ElevatedButton(onPressed: Signup, child: Text("signup"))
                      SizedBox(
                        height: 14,
                      ),
                      Center(
                        child: Text(
                          'Need Help ?',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: GoogleFonts.poppins().fontFamily),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
