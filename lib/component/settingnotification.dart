

import 'package:flutter/material.dart';
import 'package:ui_design/component/notification.dart';

class SettingCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function onPressed;
  final Icon icon;
  const SettingCard({super.key, required this.title, required this.onPressed, required this.subTitle ,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        
        onTap: onPressed(),
        child: Container(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
      
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
                ),
                child: Row(
                  children: [
                    // Icon(Icons.notifications,color: Colors.grey,size: 27,),
                    icon,
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Text('${title}'),
                      
                        Text('${subTitle}'),
                        
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}