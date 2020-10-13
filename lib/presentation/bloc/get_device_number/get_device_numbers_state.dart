part of 'get_device_numbers_cubit.dart';

abstract class GetDeviceNumbersState extends Equatable {
  const GetDeviceNumbersState();
}

class GetDeviceNumbersInitial extends GetDeviceNumbersState {
  @override
  List<Object> get props => [];
}

class GetDeviceNumbersLoading extends GetDeviceNumbersState {
  @override
  List<Object> get props => [];
}
class GetDeviceNumbersLoaded extends GetDeviceNumbersState {
  final List<ContactEntity> contacts;

  GetDeviceNumbersLoaded({this.contacts});

  @override
  List<Object> get props => [];
}
class GetDeviceNumbersFailure extends GetDeviceNumbersState {
  @override
  List<Object> get props => [];
}
