part of 'send_and_recive_message_bloc.dart';

@immutable
abstract class SendAndReciveMessageState {}

class SendAndReciveMessageInitial extends SendAndReciveMessageState {}

class Good extends SendAndReciveMessageState {
  final String message;

  Good(this.message);
}



class Load extends SendAndReciveMessageState {}



class Error extends SendAndReciveMessageState {}