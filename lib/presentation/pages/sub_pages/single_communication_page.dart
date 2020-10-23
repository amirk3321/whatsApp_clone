import 'dart:async';

import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whatsapp_clone/presentation/bloc/communication/communication_cubit.dart';
import 'package:flutter_whatsapp_clone/presentation/widgets/theme/style.dart';
import 'package:intl/intl.dart';

class SingleCommunicationPage extends StatefulWidget {
  final String senderUID;
  final String recipientUID;
  final String senderName;
  final String recipientName;
  final String recipientPhoneNumber;
  final String senderPhoneNumber;

  const SingleCommunicationPage(
      {Key key,
      this.senderUID,
      this.recipientUID,
      this.senderName,
      this.recipientName,
      this.recipientPhoneNumber,
      this.senderPhoneNumber})
      : super(key: key);

  @override
  _SingleCommunicationPageState createState() =>
      _SingleCommunicationPageState();
}

class _SingleCommunicationPageState extends State<SingleCommunicationPage> {
  TextEditingController _textMessageController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    BlocProvider.of<CommunicationCubit>(context).getMessages(
      senderId: widget.senderUID,
      recipientId: widget.recipientUID,
    );
    _textMessageController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _textMessageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        automaticallyImplyLeading: false,
        actions: [
          Icon(Icons.videocam),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.call),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.more_vert),
        ],
        flexibleSpace: Container(
          margin: EdgeInsets.only(top: 30),
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 22,
                  )),
              Container(
                height: 40,
                width: 40,
                child: Image.asset('assets/profile_default.png'),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "${widget.recipientName}",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<CommunicationCubit, CommunicationState>(
        builder: (_, communicationState) {
          if (communicationState is CommunicationLoaded) {
            return _bodyWidget(communicationState);
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _bodyWidget(CommunicationLoaded communicationState) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          child: Image.asset(
            "assets/background_wallpaper.png",
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            _messagesListWidget(communicationState),
            _sendMessageTextField(),
          ],
        )
      ],
    );
  }

  Widget _messagesListWidget(CommunicationLoaded messages) {
    Timer(Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInQuad,
      );
    });
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: messages.messages.length,
        itemBuilder: (_, index) {
          final message = messages.messages[index];

          if (message.sederUID == widget.senderUID)
            return _messageLayout(
              color: Colors.lightGreen[400],
              time: DateFormat('hh:mm a').format(message.time.toDate()),
              align: TextAlign.left,
              boxAlign: CrossAxisAlignment.start,
              crossAlign: CrossAxisAlignment.end,
              nip: BubbleNip.rightTop,
              text: message.message,
            );
          else
            return _messageLayout(
              color: Colors.white,
              time: DateFormat('hh:mm a').format(message.time.toDate()),
              align: TextAlign.left,
              boxAlign: CrossAxisAlignment.start,
              crossAlign: CrossAxisAlignment.start,
              nip: BubbleNip.leftTop,
              text: message.message,
            );
        },
      ),
    );
  }

  Widget _sendMessageTextField() {
    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 4, right: 4),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(80)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        offset: Offset(0.0, 0.50),
                        spreadRadius: 1,
                        blurRadius: 1),
                  ]),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.insert_emoticon,
                    color: Colors.grey[500],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 60,
                      ),
                      child: Scrollbar(
                        child: TextField(
                          maxLines: null,
                          style: TextStyle(fontSize: 14),
                          controller: _textMessageController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type a message",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.link),
                      SizedBox(
                        width: 10,
                      ),
                      _textMessageController.text.isEmpty
                          ? Icon(Icons.camera_alt)
                          : Text(""),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          InkWell(
            onTap: () {
              if (_textMessageController.text.isNotEmpty) {
                _sendTextMessage();
              }
            },
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Icon(
                _textMessageController.text.isEmpty ? Icons.mic : Icons.send,
                color: textIconColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _messageLayout({
    text,
    time,
    color,
    align,
    boxAlign,
    nip,
    crossAlign,
  }) {
    return Column(
      crossAxisAlignment: crossAlign,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.90,
          ),
          child: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(3),
            child: Bubble(
              color: color,
              nip: nip,
              child: Column(
                crossAxisAlignment: crossAlign,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    text,
                    textAlign: align,
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    time,
                    textAlign: align,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(
                        .4,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  void _sendTextMessage() {
    if (_textMessageController.text.isNotEmpty) {
      BlocProvider.of<CommunicationCubit>(context).sendTextMessage(
        recipientId: widget.recipientUID,
        senderId: widget.senderUID,
        recipientPhoneNumber: widget.recipientPhoneNumber,
        recipientName: widget.recipientName,
        senderPhoneNumber: widget.senderPhoneNumber,
        senderName: widget.senderName,
        message: _textMessageController.text,
      );
      _textMessageController.clear();
    }
  }
}
