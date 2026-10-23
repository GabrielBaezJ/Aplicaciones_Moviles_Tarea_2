import 'package:flutter/material.dart';

import '../atomos/campo_texto.dart';

class CustomCampoTexto extends StatelessWidget {
  final String etiqueta;
  final String hint;
  final TextEditingController controller;
  final IconData icono;
  final String? errorText;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType tipoTeclado;

  const CustomCampoTexto({
    super.key,
    required this.etiqueta,
    required this.hint,
    required this.controller,
    required this.icono,
    this.errorText,
    this.obscureText = false,
    this.suffixIcon,
    this.tipoTeclado = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CampoTexto(
          texto: etiqueta,
          tamano: 14,
          peso: FontWeight.w600,
          color: Color(0xFF455A64),
          alineacion: TextAlign.start,
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: tipoTeclado,
          decoration: InputDecoration(
            hintText: hint,
            errorText: errorText,
            filled: true,
            fillColor: Color(0xFFF1F6FF),
            prefixIcon: Icon(icono, color: Color(0xFF1565C0)),
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.symmetric(vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: Color(0xFFBBDEFB)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: Color(0xFF1565C0), width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: Colors.redAccent),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: Colors.redAccent, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
