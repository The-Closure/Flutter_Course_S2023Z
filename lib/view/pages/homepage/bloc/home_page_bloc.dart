
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:plan_and_go/domain/login.dart';

import '../../../../data/user_model/user_model.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    on<LogIn>((event, emit)async {
      emit(Loading());
      String data  = await login(event.userdata);

      if (data == 'error'){
        emit(Error());
      }
      else {
        emit(Success(token: data));
        print(state);
      }
    });
  }
}
