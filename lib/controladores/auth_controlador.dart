import '../modelos/usuario_modelo.dart';

class AuthControlador {
  // Usuario simulado localmente
  final UsuarioModelo usuarioValido = UsuarioModelo(
    usuario: 'admin@espe.edu.ec',
    password: '1234',
  );

  String? validarCorreo(String correo) {
    final texto = correo.trim();

    if (texto.isEmpty) {
      return 'Ingrese su correo electrónico';
    }

    final formato = RegExp(r'^[\w.\-]+@[\w\-]+(\.[\w\-]+)+$');
    if (!formato.hasMatch(texto)) {
      return 'Ingrese un correo válido (ejemplo@correo.com)';
    }

    return null;
  }

  String? validarPassword(String password) {
    if (password.isEmpty) {
      return 'Ingrese su contraseña';
    }
    return null;
  }

  bool verificarCredenciales(String correo, String password) {
    return correo.trim().toLowerCase() == usuarioValido.usuario &&
        password == usuarioValido.password;
  }
}
