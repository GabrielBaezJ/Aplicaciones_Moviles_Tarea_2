import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  final String texto;
  final double tamano;
  final FontWeight peso;
  final Color color;
  final TextAlign alineacion;

  const CampoTexto({
    super.key,
    required this.texto,
    required this.tamano,
    required this.peso,
    required this.color,
    required this.alineacion,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      textAlign: alineacion,
      style: TextStyle(fontSize: tamano, fontWeight: peso, color: color),
    );
  }
}
