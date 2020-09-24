import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone/presentation/pages/sub_pages/single_item_chat_user_page.dart';
import 'package:flutter_whatsapp_clone/presentation/widgets/theme/style.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (_,index){
                return SingleItemChatUserPage();
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: (){},
        child: Icon(Icons.chat),
      ),
    );
  }
}
