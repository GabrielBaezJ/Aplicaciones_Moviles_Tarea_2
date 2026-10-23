import '../modelos/usuario_modelo.dart';

class AuthControlador {
  final UsuarioModelo usuarioValido = UsuarioModelo(
    usuario: 'admin@admin.com',
    password: '1234',
  );
  String? validarUsuario(String usuario) {
    if (usuario.trim().isEmpty) {
      return 'Ingrese su usuario';
    }
    return null;
  }

  String? validarPassword(String password) {
    if (password.isEmpty) {
      return 'Ingrese su contraseña';
    }
    return null;
  }

  bool verificarCredenciaes(String usuario, String password) {
    return usuario.trim() == usuarioValido.usuario &&
        password == usuarioValido.password;
  }
}
