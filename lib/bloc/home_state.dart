part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}


class Success extends HomeState {
final   String username ;

  Success(this.username);
}



class Loading extends HomeState {}



class Error extends HomeState {}