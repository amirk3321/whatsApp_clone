part of 'phone_auth_cubit.dart';

abstract class PhoneAuthState extends Equatable {
  const PhoneAuthState();
}

class PhoneAuthInitial extends PhoneAuthState {
  @override
  List<Object> get props => [];
}

class PhoneAuthLoading extends PhoneAuthState {
  @override
  List<Object> get props => [];
}
class PhoneAuthSmsCodeReceived extends PhoneAuthState {
  @override
  List<Object> get props => [];
  @override
  String toString() {
    print("auth sms received");
    return super.toString();
  }
}
class PhoneAuthProfileInfo extends PhoneAuthState {
  @override
  List<Object> get props => [];
}
class PhoneAuthSuccess extends PhoneAuthState {
  @override
  List<Object> get props => [];
}
class PhoneAuthFailure extends PhoneAuthState {
  @override
  List<Object> get props => [];
}

