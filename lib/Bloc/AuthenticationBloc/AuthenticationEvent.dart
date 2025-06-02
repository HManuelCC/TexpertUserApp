import 'package:equatable/equatable.dart';
import 'package:supportapp/Data/Models/User.dart';

class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class AuthentWhithCredentials extends AuthenticationEvent {
  final AuthResponse? user;

  const AuthentWhithCredentials(this.user);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
