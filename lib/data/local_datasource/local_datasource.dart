


import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_whatsapp_clone/domain/entities/contact_entity.dart';

abstract class LocalDataSource{
  Future<List<ContactEntity>> getDeviceNumbers();
}

class LocalDataSourceImpl implements LocalDataSource{
  @override
  Future<List<ContactEntity>> getDeviceNumbers()async {
   List<ContactEntity> contacts=[];
   final getContactsData= await ContactsService.getContacts();

   getContactsData.forEach((myContact) {
     myContact.phones.forEach((phoneData) {
       contacts.add(ContactEntity(
         phoneNumber: phoneData.value,
         label: myContact.displayName,
       ));
     });
   });
   return contacts;
  }

}