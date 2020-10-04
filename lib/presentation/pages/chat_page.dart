import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone/presentation/pages/sub_pages/single_item_chat_user_page.dart';
import 'package:flutter_whatsapp_clone/presentation/widgets/theme/style.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: greenColor.withOpacity(.5),
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            child: Icon(
              Icons.message,
              color: Colors.white.withOpacity(.6),
              size: 40,
            ),
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "Start chat with your friends and family,\n on WhatsApp Clone",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14,color: Colors.black.withOpacity(.4)),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {},
        child: Icon(Icons.chat),
      ),
    );
  }

  Widget _myChatList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index) {
          return SingleItemChatUserPage();
        },
      ),
    );
  }
}
