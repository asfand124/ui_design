import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui_design/screen/Home.dart';
import 'package:ui_design/screen/Signup.dart';

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
    checkuser();
  }

  checkuser() async {
    if (FirebaseAuth.instance.currentUser != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.push(
          context as BuildContext,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      });
    }
  }

  Signin() async {
    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email.text, password: _pass.text)
          .then((value) {
        Navigator.push(
          context as BuildContext,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      });
    } catch (e) {
      print(e);
    }
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
