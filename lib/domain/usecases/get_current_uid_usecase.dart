

import 'package:flutter_whatsapp_clone/domain/repositories/firebase_repository.dart';

class GetCurrentUidUseCase{
  final FirebaseRepository repository;

  GetCurrentUidUseCase({this.repository});

  Future<String> call()async{
    return await repository.getCurrentUID();
  }
}