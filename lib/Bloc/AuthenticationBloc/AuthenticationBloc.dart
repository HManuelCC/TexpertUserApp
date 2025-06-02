import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supportapp/Bloc/AuthenticationBloc/AuthenticationEvent.dart';
import 'package:supportapp/Bloc/AuthenticationBloc/AuthenticationState.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AppStarted>(_onAppStarted);
    on<AuthentWhithCredentials>(_onAuthentWhithCredentials);
  }
}

_onAppStarted(AppStarted event, Emitter<AuthenticationState> emit) async {
  emit(UnAuthenticated());
}

_onAuthentWhithCredentials(
    AuthentWhithCredentials event, Emitter<AuthenticationState> emit) async {
  print("object");
  emit(Authenticated(null));
}
