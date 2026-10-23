import 'package:flutter/material.dart';

import 'diseno_campo_texto.dart';

class CampoPassword extends StatefulWidget {
  final TextEditingController controller;
  final String? errorText;

  const CampoPassword({super.key, required this.controller, this.errorText});

  @override
  State<CampoPassword> createState() => _CampoPasswordState();
}

class _CampoPasswordState extends State<CampoPassword> {
  bool ocultar = true;

  @override
  Widget build(BuildContext context) {
    //reutilizar la molécula general
    return CustomCampoTexto(
      etiqueta: 'Contraseña',
      hint: 'Ingrese su contraseña',
      controller: widget.controller,
      icono: Icons.lock_outline,
      errorText: widget.errorText,
      obscureText: ocultar,
      suffixIcon: IconButton(
        icon: Icon(
          ocultar ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: Color(0xFF1565C0),
        ),
        onPressed: () {
          setState(() {
            ocultar = !ocultar;
          });
        },
      ),
    );
  }
}
