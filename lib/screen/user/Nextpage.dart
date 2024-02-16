import 'package:flutter/material.dart';

import 'package:ui_design/component/TaskDetail.dart';

class Dis extends StatelessWidget {
  const Dis({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
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
    
    );
  }
}
