import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_design/component/settingnotification.dart';

class UserSetting extends StatelessWidget {
  
  const UserSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,right: 20,left: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
              Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi, Asfandyar ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontFamily: GoogleFonts.inter().fontFamily,
                              ),
                            ),
                            Text(
                              '17 Feb 2023',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: GoogleFonts.inter().fontFamily,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Color(0xffFB6565),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                       
                        
                      ],
                    ),
                  ),
                ),
                 SizedBox(height: 30,),
                Container(height: 450,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 207, 207, 207),
                ),
                  child:
              
                   Column(
                     children: [
                      SizedBox(height: 10,),
                       SettingCard(title: "Notification", onPressed: (){},
                        subTitle: "Change Notification ",icon: Icon(Icons.notifications),),
                       SettingCard(title: "Password", onPressed: (){}, subTitle: "Change Password Settings",icon: Icon(Icons.lock),),
                       SettingCard(title: "Statistics", onPressed: (){}, subTitle: "Change Statistics ",icon: Icon(Icons.signal_cellular_alt),),
                       SettingCard(title: "Terms&Conditions", onPressed: (){}, subTitle: "Terms&Conditions",icon: Icon(Icons.copy_sharp),),
                       SettingCard(title: "About", onPressed: (){}, subTitle: "About",icon: Icon(Icons.question_mark),),
                      
                     ],
                   ),
                   
                   ),
                   SizedBox(height: 20,),
                   ElevatedButton(onPressed: (){}, 
                          style: ElevatedButton.styleFrom(
                          backgroundColor:Color(0xff349EFF),
                          minimumSize: Size(220, 50),
                          
                          textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400)),
                          child: Text("Log out",style: TextStyle(color: Colors.white),),),
                   SizedBox(height: 30,),
                   
                
          ],
        ),
      ),
    );
  }
}