import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supportapp/Data/Models/User.dart';
import 'package:supportapp/Data/Objects/Server.dart';

import 'LoginEvent.dart';
import 'LoginState.dart';

import 'package:http/http.dart' as http;

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginWhithCredentials>(_onLoginWhithCredentials);
    on<LogOut>(_onLogOut);
  }
}

void _onLoginWhithCredentials(
  LoginWhithCredentials event,
  Emitter<LoginState> emit,
) async {
  emit(LoginLoading());
  try {
    print("Intentando iniciar sesión con: ${event.email} y ${event.password}");
    var result = await http
        .post(Uri.parse(Server.getUri("/api/user/login")),
            body: json
                .encode({"username": event.email, "password": event.password}))
        .timeout(Duration(seconds: 5));

    if (result.statusCode != 200) {
      emit(LoginFailure(result.body.toString()));
    } else {
      var usuarioAuth =
          AuthResponse.fromJson(json.decode(result.body.toString()));
      print(usuarioAuth.token);
      var responseProfile = await Server.obtenerPerfil(usuarioAuth.token!);
      if (responseProfile == null) {
        emit(LoginFailure("Error al obtener el perfil del usuario"));
        return;
      }
      var usuarioData = UserData.fromJson(json.decode(responseProfile));
      emit(LoginSuccess(usuarioData));
    }
  } catch (_) {
    print(_);
    emit(LoginFailure("Error de conexión"));
  }
}

void _onLogOut(
  LogOut event,
  Emitter<LoginState> emit,
) async {
  emit(LoginInitial());
}
