import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_design/component/settingnotification.dart';

class UserSetting extends StatelessWidget {
  
  const UserSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
       
        children: [
          //---------------iamge--------------------------------
           Padding(
             padding: const EdgeInsets.only(left: 20,right: 20,top: 15),
             child: Row(
             
               children: [
                 CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/image.png',),
                 ),
                 SizedBox(width: 20,),
                 Column(
                  children: [
                     Text('Huzaifa Tawab'),
               Row(
               children: [
                 Text('Balance: '),
                 Text('PKR 0'),
               ],
                ),
                  ],
                 ),
               ],
             ),
           ),
           SizedBox(
            height: 15,
           ),
          Container(
            height: MediaQuery.of(context).size.height*0.73,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(right: 10,left: 15),
            decoration: BoxDecoration(
              color:  Color.fromARGB(255, 207, 202, 255),
             
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18,top: 10),
                          child: Text('Setting',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700
                          ,fontFamily: GoogleFonts.poppins().fontFamily),),
                        ),
                         SizedBox(
                    height: 15,
                  ),
                  
                  Container(
                    height: 40,
                    padding: EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                      border: Border(
                      
                        bottom: BorderSide(color: const Color.fromARGB(68, 0, 0, 0)),
                      ),
                    ),
                    child: Row(
                     
                      children: [
                        Icon(Icons.person_2_outlined),
                        SizedBox(width: 30,),
                        Text('Profile'),
                        SizedBox(width: 180,),
                        Icon(Icons.arrow_forward_ios_outlined),
                    
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  
                  Container(
                    height: 40,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      border: Border(
                      
                        bottom: BorderSide(color: const Color.fromARGB(68, 0, 0, 0)),
                      ),
                    ),
                    child: Row(
                     
                      children: [
                        Icon(Icons.perm_device_information_outlined),
                        SizedBox(width: 30,),
                        Text('Information'),
                        SizedBox(width: 150,),
                        Icon(Icons.arrow_forward_ios_outlined),
                    
                      ],
                    ),
                  ),
                   SizedBox(
                    height: 15,
                  ),
                  
                  Container(
                    height: 40,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      border: Border(
                     
                        bottom: BorderSide(color: const Color.fromARGB(68, 0, 0, 0)),
                      ),
                    ),
                    child: Row(
                     
                      children: [
                        Icon(Icons.person_4_outlined),
                        SizedBox(width: 30,),
                        Text('About'),
                        SizedBox(width: 190,),
                        Icon(Icons.arrow_forward_ios_outlined),
                    
                      ],
                    ),
                  ),
                      ],
                    ),
                    
                  ),
                 
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 10),
                          child: Text('  Resources',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700
                          ,fontFamily: GoogleFonts.poppins().fontFamily),),
                        ),
                          SizedBox(
                    height: 10,
                  ),
                  
                  Container(
                    height: 40,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      border: Border(
               
                        bottom: BorderSide(color: const Color.fromARGB(68, 0, 0, 0)),
                      ),
                    ),
                    child: Row(
                     
                      children: [
                        Icon(Icons.question_mark_rounded),
                        SizedBox(width: 30,),
                        Text('leagel'),
                        SizedBox(width: 190,),
                        Icon(Icons.arrow_forward_ios_outlined),
                    
                      ],
                    ),
                  ), SizedBox(
                    height: 15,
                  ),
                  
                  Container(
                    height: 40,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        
                        bottom: BorderSide(color: const Color.fromARGB(68, 0, 0, 0)),
                      ),
                    ),
                    child: Row(
                     
                      children: [
                        Icon(Icons.lock_open_rounded),
                        SizedBox(width: 30,),
                        Text('Terms and condition'),
                        SizedBox(width: 100,),
                        Icon(Icons.arrow_forward_ios_outlined),
                    
                      ],
                    ),
                  ), SizedBox(
                    height: 15,
                  ),
                  
                  Container(
                    height: 40,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      border: Border(
                     
                        bottom: BorderSide(color: const Color.fromARGB(68, 0, 0, 0)),
                      ),
                    ),
                    child: Row(
                     
                      children: [
                        Icon(Icons.info),
                        SizedBox(width: 30,),
                        Text('support'),
                        SizedBox(width: 185,),
                        Icon(Icons.arrow_forward_ios_outlined),
                    
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 10,top: 6),
                    decoration: BoxDecoration(
                       border: Border(
                       
                      
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Logout',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700
                  ,fontFamily: GoogleFonts.poppins().fontFamily),),
                      ],
                    ),
                  ),
                      ],
                    ),
                  ),
                 
                         
                 
                   
                      ],
                      ),
            ),
        ),  
        ],
      );
    
  }
}