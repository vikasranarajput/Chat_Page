// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:demoapp/message.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class APIs {
//   static FirebaseAuth auth = FirebaseAuth.instance;

//   static FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

//   // static FirebaseStorage storage = FirebaseStorage.instance;

//   // static late ChatUser me;

//   static User get user => auth.currentUser!;

//   static getAllMessage() {}

//   //  static String getConversationId(String id)=> user.uid.hashCode <= id.hashCode ? '${uset.uid}_$id' : '${id}_${user.uid}'

//   // static Stream<OuerySnapshot<Map<String, dynamic>>> getAllMessages(ChatUser user){
//   //   return firestore.collection('chats/${getConversationID(user.id)}/messages/').snapshots();
//   // }

//   // static Future<void> sendMessage{ChatUser chatUser, String msg}async {
//   // final time = DateTime.now().millisecondsSinceEpoch.toString();
//   // final Message message = Message(toId: user.id, msg: msg, read: '', type: Type.text, formId: user.uid, sent: time);
// // final ref = firestorer.collection('chats/${getConversationID(user.id)}/messages/');
// // await ref.doc(time).set(message.toJson());
//   // }
// }
