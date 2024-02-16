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

getUserType() {
  String uid = getUserId();
  String type = "";
  if (uid != "") {
    final docRef = FirebaseFirestore.instance.collection("Users").doc(uid);
    docRef.get().then(
      (doc) {
        type = doc.data()!["Type"];
      },
      onError: (e) => print("Error getting getUser Type: $e"),
    );
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
