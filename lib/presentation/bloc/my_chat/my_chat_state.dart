part of 'my_chat_cubit.dart';

abstract class MyChatState extends Equatable {
  const MyChatState();
}

class MyChatInitial extends MyChatState {
  @override
  List<Object> get props => [];
}
class MyChatLoaded extends MyChatState {
  final List<MyChatEntity> myChat;

  MyChatLoaded({this.myChat});
  @override
  List<Object> get props => [myChat];
}
