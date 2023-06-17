part of 'send_and_recive_message_bloc.dart';

@immutable
abstract class SendAndReciveMessageEvent {}


class SendMessage extends SendAndReciveMessageEvent {
final MessageModel message;

  SendMessage(this.message);

}