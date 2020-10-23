import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_platform_interface/src/timestamp.dart';
import 'package:flutter_whatsapp_clone/domain/entities/text_message_entity.dart';

class TextMessageModel extends TextMessageEntity {
  TextMessageModel(
 {   String senderName,
    String sederUID,
    String recipientName,
    String recipientUID,
    String messageType,
    String message,
    String messageId,
    Timestamp time,}
  ) : super(
    senderName:senderName,
    sederUID: sederUID,
    recipientName: recipientName,
    recipientUID: recipientUID,
    messsageType:messageType,
    message:message,
    messageId:messageId,
    time: time,
        );
  factory TextMessageModel.fromSnapShot(DocumentSnapshot snapshot){
    return TextMessageModel(
      senderName: snapshot.data()['senderName'],
      sederUID: snapshot.data()['sederUID'],
      recipientName: snapshot.data()['recipientName'],
      recipientUID: snapshot.data()['recipientUID'],
      messageType: snapshot.data()['messageType'],
      message: snapshot.data()['message'],
      messageId: snapshot.data()['messageId'],
      time: snapshot.data()['time'],
    );
  }
  Map<String,dynamic> toDocument(){
    return {
      "senderName":senderName,
      "sederUID":sederUID,
      "recipientName":recipientName,
      "recipientUID":recipientUID,
      "messageType":messsageType,
      "message":message,
      "messageId":messageId,
      "time":time,
    };
  }
}
