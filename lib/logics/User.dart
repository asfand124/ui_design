import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

getUserId() {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    return user.uid;
  } else {
    return "";
  }
}

getUserType() async {
  String uid = getUserId();
  String type = "user";

  if (uid != "") {
    final docRef = FirebaseFirestore.instance.collection("Users").doc(uid);

    try {
      var doc = await docRef.get();
      if (doc.exists) {
        type = doc.data()!["Type"];
      } else {
        print("Document does not exist");
      }
    } catch (e) {
      print("Error getting user type: $e");
    }
  }

  return type;
}

Future<String> getUserCurrentTaskId() async {
  String uid = getUserId();
  String taskId = "";
  if (uid != "") {
    final docRef = FirebaseFirestore.instance.collection("Users").doc(uid);
    try {
      var doc = await docRef.get();
      if (doc.exists) {
        if (doc.data()!["activeTask"] != null) {
          taskId = doc.data()!["activeTask"];
        } else {
          taskId = "";
        }
      }
    } catch (e) {
      print(e);
    }
  }
  print(taskId == "");

  return taskId;
}
getUserNameById(String id) async {

  String name = "";

    final docRef = FirebaseFirestore.instance.collection("Users").doc(id);
    try {
      var doc = await docRef.get();
      if (doc.exists) {
      
          name ="${ doc.data()!["Name"]} ${doc.data()!["FatherName"]}";
        } 
      }
     catch (e) {
      print(e);
    }
  
 

  return name;
}