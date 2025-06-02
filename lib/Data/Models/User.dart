class LoginData {
  String? email;
  String? password;

  LoginData({this.email, this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      email: json['email'],
      password: json['password'],
    );
  }
}

class AuthResponse {
  String? token;
  String? refreshToken;
  int? idUsuario;

  AuthResponse({
    this.token,
    this.refreshToken,
    this.idUsuario,
  });
  Map<String, dynamic> toJson() {
    return {
      'access_token': token,
      'refresh_token': refreshToken,
      'id_persona': idUsuario,
    };
  }

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['access_token'],
      refreshToken: json['refresh_token'],
      idUsuario: json['id_persona'],
    );
  }
  @override
  String toString() {
    return 'AuthResponse(token: $token, refreshToken: $refreshToken, idUsuario: $idUsuario)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthResponse &&
        other.token == token &&
        other.refreshToken == refreshToken &&
        other.idUsuario == idUsuario;
  }

  String getUsername() {
    return token?.split('.')[0] ?? '';
  }

  String getEmail() {
    return token?.split('.')[1] ?? '';
  }

  String getAnyDesk() {
    return token?.split('.')[2] ?? '';
  }
}

class UserData {
  String? nombre;
  String? email;
  String? password;
  String? ap_Materno;
  String? ap_Paterno;
  String? anyDesk;
  int emp = 0;

  UserData({
    this.nombre,
    this.email,
    this.password,
    this.ap_Materno,
    this.ap_Paterno,
    this.anyDesk,
    this.emp = 0,
  });
  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'correo': email,
      'password': password,
      'ap_Materno': ap_Materno,
      'ap_Paterno': ap_Paterno,
      'anyDesk': anyDesk,
      'emp': emp,
    };
  }

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      nombre: json['nombre'],
      email: json['correo'],
      ap_Materno: json['ap_Materno'],
      ap_Paterno: json['ap_Paterno'],
      anyDesk: json['anyDesk'],
      emp: json['emp'] ?? 0,
    );
  }
}
