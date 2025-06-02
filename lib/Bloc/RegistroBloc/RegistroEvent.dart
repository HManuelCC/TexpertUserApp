import 'package:equatable/equatable.dart';
import 'package:supportapp/Data/Models/User.dart';

class RegistroEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegistroWhithCredentials extends RegistroEvent {
  final UserData usuario;

  RegistroWhithCredentials(this.usuario);

  @override
  List<Object?> get props => [usuario];
}
