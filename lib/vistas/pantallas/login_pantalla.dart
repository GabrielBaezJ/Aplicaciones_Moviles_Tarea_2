import 'package:flutter/material.dart';

import '../../controladores/auth_controlador.dart';
import '../atomos/campo_boton.dart';
import '../atomos/campo_texto.dart';
import '../moleculas/campo_contrasena.dart';
import '../moleculas/diseno_campo_texto.dart';

class LoginPantalla extends StatefulWidget {
  const LoginPantalla({super.key});

  @override
  State<LoginPantalla> createState() => _LoginPantallaState();
}

class _LoginPantallaState extends State<LoginPantalla> {
  final TextEditingController correoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthControlador auth = AuthControlador();

  String? errorCorreo;
  String? errorPassword;
  String? mensajeError;

  void iniciarSesion() {
    setState(() {
      errorCorreo = auth.validarCorreo(correoController.text);
      errorPassword = auth.validarPassword(passwordController.text);
      mensajeError = null;
    });

    // Si hay campos vacíos o con formato inválido no se verifica nada más
    if (errorCorreo != null || errorPassword != null) {
      return;
    }

    final correcto = auth.verificarCredenciales(
      correoController.text,
      passwordController.text,
    );

    if (correcto) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Inicio de sesión exitoso')));
      Navigator.pushNamed(context, '/calculadora');
    } else {
      setState(() {
        mensajeError = 'Correo o contraseña incorrectos';
      });
    }
  }

  void limpiar() {
    correoController.clear();
    passwordController.clear();
    setState(() {
      errorCorreo = null;
      errorPassword = null;
      mensajeError = null;
    });
  }

  @override
  void dispose() {
    correoController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0D47A1), Color(0xFF42A5F5)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  // Encabezado
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Icon(Icons.lan, size: 52, color: Color(0xFF1565C0)),
                  ),
                  SizedBox(height: 20),
                  CampoTexto(
                    texto: 'Calculadora de Subredes',
                    tamano: 26,
                    peso: FontWeight.bold,
                    color: Colors.white,
                    alineacion: TextAlign.center,
                  ),
                  SizedBox(height: 6),
                  CampoTexto(
                    texto: 'Inicia sesión para continuar',
                    tamano: 15,
                    peso: FontWeight.normal,
                    color: Colors.white70,
                    alineacion: TextAlign.center,
                  ),
                  SizedBox(height: 28),

                  // Tarjeta del formulario
                  Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        CustomCampoTexto(
                          etiqueta: 'Correo electrónico',
                          hint: 'ejemplo@correo.com',
                          controller: correoController,
                          icono: Icons.email_outlined,
                          errorText: errorCorreo,
                          tipoTeclado: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 18),
                        CampoPassword(
                          controller: passwordController,
                          errorText: errorPassword,
                        ),
                        SizedBox(height: 18),

                        // Mensaje de credenciales incorrectas
                        if (mensajeError != null)
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: 18),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFEBEE),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.redAccent),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  color: Colors.redAccent,
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: CampoTexto(
                                    texto: mensajeError!,
                                    tamano: 14,
                                    peso: FontWeight.normal,
                                    color: Colors.redAccent,
                                    alineacion: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        CampoBoton(
                          texto: 'Iniciar sesión',
                          icono: Icons.login,
                          onPressed: iniciarSesion,
                        ),
                        SizedBox(height: 12),
                        CampoBoton(
                          texto: 'Limpiar',
                          icono: Icons.cleaning_services_outlined,
                          secundario: true,
                          onPressed: limpiar,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
