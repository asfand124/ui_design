import 'package:flutter/material.dart';

import 'package:ui_design/component/TaskDetail.dart';

class Dis extends StatelessWidget {
  const Dis({super.key});

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: Color(0xffEAF0F0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TaskDetail(taskDetails: {}),
                        ),
                      );
                    },
                    child: Text('redo this page'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
