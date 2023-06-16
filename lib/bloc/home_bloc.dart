import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<Login>((event, emit) async {
SharedPreferences storage =await SharedPreferences.getInstance();
if(storage.getString('username') == 'abd'){
        emit(Success(storage.getString('username') ?? 'error in storage'));

}
else {
    emit(Loading());
      print(event.username);

      storage.setString('username',event.username);

}
  
      
    });
  }
}
