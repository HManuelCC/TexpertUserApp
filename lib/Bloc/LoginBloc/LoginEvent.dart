import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginWhithCredentials extends LoginEvent {
  final String email;
  final String password;

  const LoginWhithCredentials(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class LogOut extends LoginEvent {}
