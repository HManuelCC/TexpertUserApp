import 'package:equatable/equatable.dart';
import 'package:supportapp/Data/Models/User.dart';

class RegistroState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegistroInitial extends RegistroState {}

class RegistroLoading extends RegistroState {}

class RegistroSuccess extends RegistroState {
  final AuthResponse user;

  RegistroSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class RegistroFailure extends RegistroState {
  final String error;

  RegistroFailure(this.error);

  @override
  List<Object?> get props => [error];
}
