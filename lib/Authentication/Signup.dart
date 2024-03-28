import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:signin/loginpage.dart';
import 'package:ui_design/screen/user/Home.dart';
import 'package:ui_design/Authentication/Login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState(); 
}

TextEditingController _email = TextEditingController();
TextEditingController _pass = TextEditingController();

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    signup() async {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _email.text, password: _pass.text)
            .then((value) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
        });
      } catch (e) {
        print(e);
      }
    }

    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Your Name',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Your Email',
              ),
              controller: _email,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Your pass',
              ),
              controller: _pass,
            ),
            ElevatedButton(onPressed: signup, child: Text("signup"))
          ],
        )),
      ),
    );
  }
}
