


import 'package:flutter_whatsapp_clone/domain/repositories/firebase_repository.dart';

class GetOneToOneSingleUserChatChannelUseCase{
  final FirebaseRepository repository;

  GetOneToOneSingleUserChatChannelUseCase({this.repository});

  Future<String> call(String uid,String otherUid)async{
    return await repository.getOneToOneSingleUserChannelId(uid, otherUid);
  }
}