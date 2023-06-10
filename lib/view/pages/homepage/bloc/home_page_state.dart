// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class Success extends HomePageState {
  String token;
  Success({
    required this.token,
  });
}


class Error extends HomePageState {}

class BadRequest extends HomePageState {}

class Loading extends HomePageState {}



