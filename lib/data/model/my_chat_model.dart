import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_platform_interface/src/timestamp.dart';
import 'package:flutter_whatsapp_clone/domain/entities/my_chat_entity.dart';

class MyChatModel extends MyChatEntity {
  MyChatModel({
    String senderName,
    String senderUID,
    String recipientName,
    String recipientUID,
    String channelId,
    String profileURL,
    String recipientPhoneNumber,
    String senderPhoneNumber,
    String recentTextMessage,
    bool isRead,
    bool isArchived,
    Timestamp time,
  }) : super(
          senderName: senderName,
          senderUID: senderUID,
          recipientName: recipientName,
          recipientUID: recipientUID,
          channelId: channelId,
          profileURL: profileURL,
          recipientPhoneNumber: recipientPhoneNumber,
          senderPhoneNumber: senderPhoneNumber,
          recentTextMessage: recentTextMessage,
          isRead: isRead,
          isArchived: isArchived,
          time: time,
        );

  factory MyChatModel.fromSnapShot(DocumentSnapshot snapshot) {
    return MyChatModel(
      senderName: snapshot.data()['senderName'],
      senderUID: snapshot.data()['senderUID'],
      senderPhoneNumber: snapshot.data()['senderPhoneNumber'],
      recipientName: snapshot.data()['recipientName'],
      recipientUID: snapshot.data()['recipientUID'],
      recipientPhoneNumber: snapshot.data()['recipientPhoneNumber'],
      channelId: snapshot.data()['channelId'],
      time: snapshot.data()['time'],
      isArchived: snapshot.data()['isArchived'],
      isRead: snapshot.data()['isRead'],
      recentTextMessage: snapshot.data()['recentTextMessage'],
      profileURL: snapshot.data()['profileURL'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "senderName": senderName,
      "senderUID": senderUID,
      "recipientName": recipientName,
      "recipientUID": recipientUID,
      "channelId": channelId,
      "profileURL": profileURL,
      "recipientPhoneNumber": recipientPhoneNumber,
      "senderPhoneNumber": senderPhoneNumber,
      "recentTextMessage": recentTextMessage,
      "isRead": isRead,
      "isArchived": isArchived,
      "time": time,
    };
  }
}
