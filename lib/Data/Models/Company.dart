class Sucursal {
  int? id_sucursal;
  String? alias;
  int? encargado;
  Empresa? empresa;

  Sucursal.fromJson(Map<String, dynamic> json) {
    id_sucursal = json['id_sucursal'];
    alias = json['alias'];
    encargado = json['encargado'];
    empresa =
        json['empresa'] != null ? Empresa.fromJson(json['empresa']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_sucursal'] = id_sucursal;
    data['alias'] = alias;
    data['encargado'] = encargado;
    if (empresa != null) {
      data['empresa'] = empresa!.toJson();
    }
    return data;
  }
}

class Empresa {
  int? id_empresa;
  String? nombre;

  Empresa.fromJson(Map<String, dynamic> json) {
    id_empresa = json['id_empresa'];
    nombre = json['nombre'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_empresa'] = id_empresa;
    data['nombre'] = nombre;
    return data;
  }
}
