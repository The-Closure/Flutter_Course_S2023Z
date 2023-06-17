import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../data/message/message.dart';

part 'send_and_recive_message_event.dart';
part 'send_and_recive_message_state.dart';

class SendAndReciveMessageBloc extends Bloc<SendAndReciveMessageEvent, SendAndReciveMessageState> {
  SendAndReciveMessageBloc() : super(SendAndReciveMessageInitial()) {
    on<SendMessage>((event, emit) async{
      emit(Load());
    var data = await  sendMessage(event.message);
if(data['message'] is String){
emit(Good(data['message']));
}
else emit(Error());
    
    });
  }
}



sendMessage (MessageModel message)async{
  Dio dio = Dio();

  Response response =await dio.post('http://localhost:3000/message',data:message.toJson() );

  if (response.statusCode == 201){
    return response.data;
  }
  else return 'Error';
}