import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supportapp/Bloc/RegistroBloc/RegistroEvent.dart';
import 'package:supportapp/Bloc/RegistroBloc/RegistroState.dart';
import 'package:supportapp/Data/Models/User.dart';
import 'package:supportapp/Data/Objects/Server.dart';

import 'package:http/http.dart' as http;

class RegistroBloc extends Bloc<RegistroEvent, RegistroState> {
  RegistroBloc() : super(RegistroInitial()) {
    on<RegistroWhithCredentials>(_onRegistroWhithCredentials);
  }
}

void _onRegistroWhithCredentials(
  RegistroWhithCredentials event,
  Emitter<RegistroState> emit,
) async {
  print(event.usuario.toJson());
  emit(RegistroLoading());

  try {
    var result = await http.post(Uri.parse(Server.getUri("/api/user/registro")),
        body: json.encode(event.usuario.toJson()));
    if (result.statusCode != 200) {
      emit(RegistroFailure(result.body.toString()));
    } else {
      emit(RegistroSuccess(
          AuthResponse.fromJson(json.decode(result.body.toString()))));
    }
  } catch (_) {
    emit(RegistroFailure("Error de conexión"));
  }
}
