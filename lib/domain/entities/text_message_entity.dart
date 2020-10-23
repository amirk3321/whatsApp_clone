import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TextMessageEntity extends Equatable {
  final String senderName;
  final String sederUID;
  final String recipientName;
  final String recipientUID;
  final String messsageType;
  final String message;
  final String messageId;
  final Timestamp time;

  TextMessageEntity({
    this.senderName,
    this.sederUID,
    this.recipientName,
    this.recipientUID,
    this.messsageType,
    this.message,
    this.messageId,
    this.time,
  });

  @override
  // TODO: implement props
  List<Object> get props => [
    senderName,
    sederUID,
    recipientName,
    recipientUID,
    messsageType,
    message,
    messageId,
    time,
  ];
}
