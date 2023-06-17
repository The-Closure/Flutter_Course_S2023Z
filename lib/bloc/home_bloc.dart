import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:plan_and_go/data/local_data/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/user_model/user_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<Login>((event, emit) async {
        // print(event.user);
       var data = await login(event.user);

       print(data);
       myMagic.get<SharedPreferences>().setString('secret',data['secretcode']);
      
    });
  }
}


login (User user)async{
  Dio dio = Dio();

  Response response =await dio.post('http://localhost:3000/user',data:user.toJson() );

  if (response.statusCode == 201){
    return response.data;
  }
  else return 'Error';
}