import 'package:equatable/equatable.dart';
import 'package:supportapp/Data/Models/User.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UnAuthenticated extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final AuthResponse? user;

  const Authenticated(this.user);

  @override
  // TODO: implement props
  List<Object?> get props => [user];
}

class AuthenticationInitial extends AuthenticationState {}
