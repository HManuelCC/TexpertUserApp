import 'package:equatable/equatable.dart';
import 'package:supportapp/Data/Models/User.dart';

class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserData? user;

  const LoginSuccess(this.user);

  @override
  List<Object> get props => [user ?? ''];
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure(this.error);

  @override
  List<Object> get props => [error];
}
