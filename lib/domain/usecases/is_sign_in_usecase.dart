
import 'package:flutter_whatsapp_clone/domain/repositories/firebase_repository.dart';

class IsSignInUseCase{
  final FirebaseRepository repository;

  IsSignInUseCase({this.repository});

  Future<bool> call() async{
    return await repository.isSignIn();
  }
}