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
       
        type= doc.data()!["Type"];
      } else {
        print("Document does not exist");
       
      }
    } catch (e) {
      print("Error getting user type: $e");
 
    }
  }

  return type;
}

getUserCurrentTaskId() {
  String uid = getUserId();
  String taskId = "";
  if (uid != "") {
    final docRef = FirebaseFirestore.instance.collection("Users").doc(uid);
    docRef.get().then(
      (doc) {
        if (doc.data()!["activeTask"] != null) {
          taskId = doc.data()!["activeTask"];
        } else {
          taskId = "";
        }
      },
      onError: (e) => print("Error getting getUser Taskid: $e"),
    );
  }
  return taskId;
}
