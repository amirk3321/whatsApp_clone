

import 'package:flutter_whatsapp_clone/domain/entities/contact_entity.dart';
import 'package:flutter_whatsapp_clone/domain/repositories/get_device_number_repository.dart';

class GetDeviceNumberUseCase{
  final GetDeviceNumberRepository deviceNumberRepository;

  GetDeviceNumberUseCase({this.deviceNumberRepository});

  Future<List<ContactEntity>> call()async{
    return deviceNumberRepository.getDeviceNumbers();
  }
}