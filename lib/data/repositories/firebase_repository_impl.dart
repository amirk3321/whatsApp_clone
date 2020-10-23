

import 'package:flutter_whatsapp_clone/data/datasource/firebase_remote_datasource.dart';
import 'package:flutter_whatsapp_clone/domain/entities/my_chat_entity.dart';
import 'package:flutter_whatsapp_clone/domain/entities/text_message_entity.dart';
import 'package:flutter_whatsapp_clone/domain/entities/user_entity.dart';
import 'package:flutter_whatsapp_clone/domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository{
  final FirebaseRemoteDataSource remoteDataSource;

  FirebaseRepositoryImpl({this.remoteDataSource});
  @override
  Future<void> getCreateCurrentUser(UserEntity user) async =>
      await remoteDataSource.getCreateCurrentUser(user);

  @override
  Future<String> getCurrentUID()async =>
      await remoteDataSource.getCurrentUID();
  @override
  Future<bool> isSignIn()async =>
      await remoteDataSource.isSignIn();

  @override
  Future<void> signInWithPhoneNumber(String smsPinCode) async =>
      await remoteDataSource.signInWithPhoneNumber(smsPinCode);

  @override
  Future<void> signOut() async =>
      await remoteDataSource.signOut();

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) async =>
      await remoteDataSource.verifyPhoneNumber(phoneNumber);

  @override
  Future<void> addToMyChat(MyChatEntity myChatEntity) async{
    return remoteDataSource.addToMyChat(myChatEntity);
  }

  @override
  Future<void> createOneToOneChatChannel(String uid, String otherUid) async
  => remoteDataSource.createOneToOneChatChannel(uid, otherUid);

  @override
  Stream<List<UserEntity>> getAllUsers() =>
      remoteDataSource.getAllUsers();

  @override
  Stream<List<TextMessageEntity>> getMessages(String channelId) {
    return remoteDataSource.getMessages(channelId);
  }

  @override
  Stream<List<MyChatEntity>> getMyChat(String uid) {
    return remoteDataSource.getMyChat(uid);
  }

  @override
  Future<String> getOneToOneSingleUserChannelId(String uid, String otherUid) =>
      remoteDataSource.getOneToOneSingleUserChannelId(uid, otherUid);

  @override
  Future<void> sendTextMessage(TextMessageEntity textMessageEntity,String channelId)async {
    return remoteDataSource.sendTextMessage(textMessageEntity, channelId);
  }

}