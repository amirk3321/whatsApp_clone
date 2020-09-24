

import 'package:flutter_whatsapp_clone/domain/repositories/firebase_repository.dart';

class SignOutUseCase{
  final FirebaseRepository repository;

  SignOutUseCase({this.repository});

  Future<void> call()async{
    return await repository.signOut();
  }
}