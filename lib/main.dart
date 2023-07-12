import 'dart:convert';
import 'dart:math';

import 'package:demoapp/APIs.dart';
import 'package:demoapp/messagecard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'message.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool sender = true;
  // List<Message> _list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    Text(
                      "Task Name",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      backgroundImage: AssetImage("assets/Club Logo.png"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: StreamBuilder(
                // stream: APIs.getAllMessage(widget.user),
                builder: (context, snapshot) {
                  final _list = [
                    "Hi, My name is Vikas. I'm from B.Tech CSE in MMDU.",
                    "Hello, My name is Vishal. I'm from B.Tech CSE in MMDU.",
                  ];
                  // switch(snapshot.connectionState){

                  //   case ConnectionState.waiting:
                  //   case ConnectionState.none:
                  //   return const Center(child: CircularProgressIndicator(),);

                  //   case ConnectionState.active:
                  //   case ConnectionState.done:
                  //   final data = snapshot.data?docs;
                  //  _list = data?.map((e)=> Message.fromJson(e.data())).toList()??[];

                  //   log('Data: ${jsonEncode(data![0].data())}');
                  // }
                  // _list.clear();
                  // _list.add(Message(
                  //     toId: "User Id",
                  //     msg: "Hi",
                  //     read: "",
                  //     type: Type.text,
                  //     formId: "User Id",
                  //     sent: "Time- 12:00"));
                  // _list.add(Message(
                  //     toId: "User Id",
                  //     msg: "Hi",
                  //     read: "",
                  //     type: Type.text,
                  //     formId: "User Id",
                  //     sent: "Time- 12:00"));
                  if (_list.isNotEmpty) {
                    return ListView.builder(
                        itemCount: _list.length,
                        itemBuilder: (context, index) {
                          // return MessageCard(message: _list[index]);
                          return sender
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            vertical: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01),
                                        padding: EdgeInsets.all(
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            )),
                                        child: Text(
                                          "${_list[index]}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text("12:00 A.M"),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04),
                                          child: Icon(
                                            Icons.done_all,
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04),
                                          child: Icon(
                                            Icons.done_all,
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text("12:00 A.M"),
                                      ],
                                    ),
                                    Flexible(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            vertical: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01),
                                        padding: EdgeInsets.all(
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                              bottomLeft: Radius.circular(20),
                                            )),
                                        child: Text(
                                          "${_list[index]}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                        });
                  } else {
                    return Center(
                      child: Text(
                        "Say Hi 👋",
                        style: TextStyle(fontSize: 50),
                      ),
                    );
                  }
                },
              ),
            ),
            Container(
              height: 100,
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              color: Colors.black,
              child: Center(
                child: Expanded(
                    child: TextField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      suffixIcon:
                          IconButton(onPressed: () {}, icon: Icon(Icons.send)),
                      hintText: "Type Messages....",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35))),
                )),
              ),
            ),
          ],
        ));
  }
}

// Widget _chatInput() {
//   return Container(
//     height: 100,
//     padding: EdgeInsets.only(
//       left: 15,
//       right: 15,
//     ),
//     color: Colors.black,
//     child: Center(
//       child: Expanded(
//           child: TextField(
//         keyboardType: TextInputType.multiline,
//         decoration: InputDecoration(
//             suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.send)),
//             hintText: "Type Messages....",
//             fillColor: Colors.white,
//             filled: true,
//             border:
//                 OutlineInputBorder(borderRadius: BorderRadius.circular(35))),
//       )),
//     ),
//   );
// }
