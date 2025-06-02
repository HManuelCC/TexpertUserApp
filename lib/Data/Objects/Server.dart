import 'package:http/http.dart' as http;

class Server {
  static final Server _instance = Server._internal();

  factory Server() {
    return _instance;
  }

  Server._internal();

  static const String _host = "192.168.0.4";
  static const int _port = 8080;
  static const bool _ssh = false;

  String getHost() {
    return _host;
  }

  int getPort() {
    return _port;
  }

  bool getSsh() {
    return _ssh;
  }

  static String getUrl() {
    return _ssh ? "https://$_host:$_port" : "http://$_host:$_port";
  }

  static String getUri(String resource) {
    if (resource.startsWith("/")) {
      return "${getUrl()}$resource";
    }
    return "${getUrl()}$resource";
  }

  static Future<String?> obtenerPerfil(String accessToken) async {
    final url = Uri.parse("${getUrl()}/api/user/me");

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
