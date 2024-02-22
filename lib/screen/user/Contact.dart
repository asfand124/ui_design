import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
      child: Column(
        children: [
          Container(
             padding: EdgeInsets.only(left: 15),
            height: MediaQuery.of(context).size.height*0.35,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
      
      
            ),
          ),
        ],
      ),
    );
  }
}