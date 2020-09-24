
import 'package:flutter_whatsapp_clone/domain/repositories/firebase_repository.dart';

class VerifyPhoneNumberUseCase{

  final FirebaseRepository repository;

  VerifyPhoneNumberUseCase({this.repository});

  Future<void> call(String phoneNumber)async{
    return await repository.verifyPhoneNumber(phoneNumber);
  }
}