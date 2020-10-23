import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MyChatEntity extends Equatable {
  final String senderName;
  final String senderUID;
  final String recipientName;
  final String recipientUID;
  final String channelId;
  final String profileURL;
  final String recipientPhoneNumber;
  final String senderPhoneNumber;
  final String recentTextMessage;
  final bool isRead;
  final bool isArchived;
  final Timestamp time;

  MyChatEntity({
    this.senderName,
    this.senderUID,
    this.recipientName,
    this.recipientUID,
    this.channelId,
    this.profileURL,
    this.recipientPhoneNumber,
    this.senderPhoneNumber,
    this.recentTextMessage,
    this.isRead,
    this.isArchived,
    this.time,
  });

  @override
  // TODO: implement props
  List<Object> get props => [
        senderName,
        senderUID,
        recipientName,
        recipientUID,
        channelId,
        profileURL,
        recipientPhoneNumber,
        senderPhoneNumber,
        recentTextMessage,
        isRead,
        isArchived,
        time,
      ];
}
