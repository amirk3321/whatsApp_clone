import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_whatsapp_clone/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    String name,
    String email,
    String phoneNumber,
    bool isOnline,
    String uid,
    String status,
    String profileUrl,
  }) : super(
          name: name,
          email: email,
          phoneNumber: phoneNumber,
          isOnline: isOnline,
          uid: uid,
          status: status,
          profileUrl: profileUrl,
        );

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      name: snapshot.data()['name'],
      email: snapshot.data()['email'],
      phoneNumber: snapshot.data()['phoneNumber'],
      uid: snapshot.data()['uid'],
      isOnline: snapshot.data()['isOnline'],
      profileUrl: snapshot.data()['profileUrl'],
      status: snapshot.data()['status'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "uid": uid,
      "isOnline": isOnline,
      "profileUrl": profileUrl,
      "status": status,
    };
  }
}
