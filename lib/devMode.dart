import 'package:flutter/material.dart';
import 'package:ui_design/Authentication/Login.dart';

class devMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdddaff),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SoftXion Regulator',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Beta',
                  style: TextStyle(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 10, 14, 40)),
                ),
                Text(
                  'Version 0.1',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 20),
            FeatureRow(featureName: 'Smart Notifications', isWorking: false),
            FeatureRow(featureName: 'Offline Mode', isWorking: false),
            FeatureRow(featureName: 'Dark Mode', isWorking: false),
            FeatureRow(featureName: 'Voice Commands', isWorking: true),
            SizedBox(height: 20),
            Text(
              'Last Update: 2024-03-01 15:30',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Login()));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text(
                'Get Started',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureRow extends StatelessWidget {
  final String featureName;
  final bool isWorking;

  const FeatureRow({required this.featureName, required this.isWorking});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            isWorking ? Icons.check_circle : Icons.cancel,
            color: isWorking ? Colors.green : Colors.red,
            size: 24,
          ),
          SizedBox(width: 10),
          Text(
            featureName,
            style: TextStyle(fontSize: 18, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
