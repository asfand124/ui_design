import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ui_design/devMode.dart';
import 'package:ui_design/firebase_options.dart';
import 'package:ui_design/screen/user/Home.dart';
import 'package:ui_design/Authentication/Login.dart';
import 'package:ui_design/Authentication/Signup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      home: devMode(),
      // home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
