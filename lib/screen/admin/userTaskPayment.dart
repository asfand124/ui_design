import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_design/PageNavigation.dart';
import 'package:ui_design/component/RecentTask.dart';
import 'package:ui_design/component/RecentTaskDetail.dart';
import 'package:ui_design/logics/User.dart';
import 'package:ui_design/screen/admin/Adminnavigationpage.dart';

class UserTaskPayment extends StatefulWidget {
  const UserTaskPayment({super.key});

  @override
  State<UserTaskPayment> createState() => _userTasksState();
}

class _userTasksState extends State<UserTaskPayment> {
  List _paymentPending = [];
  List _paymentdefaulted = [];
  bool _isPaymentPendingScreen = true;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getUserTasks();
  }

  getUserTasks() {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection("Tasks")
        // .where("assignedTo", isEqualTo: userId)
        .where("Completed", isEqualTo: true)
        .where("paid", isEqualTo: false)
        .where("defaulted", isEqualTo: false)
      

        .get()
        .then((res) {
      List tempData = [];

      res.docs.forEach((element) async {
        // print(element.data()["Title"]);
        if (element.data()["assignedTo"] != null) {
          String name = "";
          final docRef = FirebaseFirestore.instance
              .collection("Users")
              .doc(element.data()["assignedTo"]);
          try {
            var doc = await docRef.get();
            if (doc.exists) {
              name = "${doc.data()!["Name"]} ${doc.data()!["FatherName"]}";
           int   credit= int.parse("${doc.data()!["credit"]} ");
           print(credit);
           
        
              print(name);
              tempData
                  .add({...element.data(), "id": element.id, "userName": name, "credit":credit});
            } 
          } catch (e) {
            print(e);
          }
        }
        else {
              tempData
                  .add({...element.data(), "id": element.id, "userName": "None"});
            }
              setState(() {
        _paymentPending = tempData;
        print("----------------------------------");
        print(_paymentPending);

        print("abc");
        isLoading = false;
      });
      });
    
    });
  }
userdebit(String Id,int creditAmount){
  FirebaseFirestore.instance.collection("Users").doc(Id).update({"credit":creditAmount });
}
 
  markPaid(String Id ,int amount){
    setState(() {
      isLoading=true;
       

    });
    Navigator.push(context,
          MaterialPageRoute(builder: ((context) => 
            AdminPageNavigation(tabNo: 3))));

  FirebaseFirestore.instance.collection("Tasks").doc(Id).update({"paid":true}).then((value){userdebit(Id, amount); getUserTasks();}
   
  
  );
}
  markDefault(String Id){
     setState(() {
      isLoading=true;
    });
     Navigator.push(context,
          MaterialPageRoute(builder: ((context) => 
            AdminPageNavigation(tabNo: 0))));
  FirebaseFirestore.instance.collection("Tasks").doc(Id).update({"defaulted":true}).then((value) => 
   getUserTasks()
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clients Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 20, top: 20),
        child: ListView.builder(
            itemCount: _paymentPending.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){
                  showDialog(context: context, builder: (context)=>  taskDialouge(index));
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  height: MediaQuery.sizeOf(context).height*0.08,
                 
                  decoration: BoxDecoration( color: Colors.white,
                  border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                  child:
                
                 Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                       children: [
                           Text("${_paymentPending[index]["userName"]}"),
                           
                           Text( "${_paymentPending[index]["Title"]}")]
                      
                  // Column
                  //               (
                  //               children: [
                  //               TextButtcon(onPressed: (){
                  //              markPaid("${_paymentPending[index]["id"]}");
                  //               }, child: Text("Paid")),
                  //                TextButton(onPressed: (){
                  //                 markDefault("${_paymentPending[index]["id"]}");
                  //                }, child: Text("Deafaulted"))],)],
                               
                                 ),),
              );
              // ElevatedButton(
              //     onPressed: () {},
              //     child: 
              //     Text("${_paymentPending[index]["userName"]} 
              // ${_paymentPending[index]["Title"]}"));
            
            }),
      ),
       
    );
    
  }
  Widget taskDialouge(int index){
return   Dialog(child: Container(color: Colors.white,
      child: Column(mainAxisSize: MainAxisSize.min,children: [
       Icon(Icons.warning,size: 44,color: Colors.red,
       ),
       Text("Are you sure to want?"),
         Text("${_paymentPending[index]["userName"]}"),
       Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
     TextButton(onPressed: (){
                               markPaid("${_paymentPending[index]["id"]}" ,12);
                             //  (int.parse("${_paymentPending[index]["amountToBePaid"].toString()}")+int.parse("${_paymentPending[index]["credit"].toString()}")));
                                }, child: Text("Paid")),
                                  TextButton(onPressed: (){
                            markDefault("${_paymentPending[index]["id"]}");
                                }, child: Text("Defaulted")),

       ],)

        ],),),);
  
}
}

Widget taskCard(context, String title) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.circular(10)),
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: EdgeInsets.only(bottom: 10),
    child: Center(
        child: Text(
      title,
      style: TextStyle(color: Colors.white),
    )),
  );
}
