import '../modelos/subred_model.dart';

class SubredControlador {
  String? validarIp(String ip) {
    if (ip.trim().isEmpty) {
      return 'Ingrese una dirección IPv4';
    }

    try {
      SubredModelo.calcular(ip: ip, prefijo: 32);
      return null;
    } on FormatException catch (error) {
      return error.message;
    }
  }

  String? validarPrefijo(String prefijo) {
    if (prefijo.trim().isEmpty) {
      return 'Ingrese un prefijo CIDR';
    }

    final valor = int.tryParse(prefijo.trim().replaceFirst('/', ''));
    if (valor == null || valor < 0 || valor > 32) {
      return 'El prefijo debe estar entre 0 y 32';
    }
    return null;
  }

  SubredModelo calcular(String ip, String prefijo) {
    final errorIp = validarIp(ip);
    if (errorIp != null) {
      throw FormatException(errorIp);
    }

    final errorPrefijo = validarPrefijo(prefijo);
    if (errorPrefijo != null) {
      throw FormatException(errorPrefijo);
    }

    return SubredModelo.calcular(
      ip: ip,
      prefijo: int.parse(prefijo.trim().replaceFirst('/', '')),
    );
  }
}
