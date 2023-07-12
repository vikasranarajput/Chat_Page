import 'package:demoapp/APIs.dart';
import 'package:demoapp/message.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatefulWidget {
  const MessageCard({super.key, required this.message});

  final Message message;

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
    // APIs.user.uid == widget.message.fromId? _senderMessage():_recieverMessage();
  }

  Widget _senderMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
                vertical: MediaQuery.of(context).size.height * 0.01),
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
            child: Text(
              "",
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
                  right: MediaQuery.of(context).size.width * 0.04),
              child: Icon(
                Icons.done_all,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _recieverMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.04),
              child: Text("12:00 A.M"),),
        Flexible(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
                vertical: MediaQuery.of(context).size.height * 0.01),
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )),
            child: Text(
              "",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
