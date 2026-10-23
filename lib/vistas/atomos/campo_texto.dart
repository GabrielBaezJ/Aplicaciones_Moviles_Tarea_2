import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  final String texto;
  final double tamanio;
  final FontWeight peso;
  final Color color;
  final TextAlign alineacion;

  CampoTexto({
    super.key,
    required this.texto,
    required this.tamanio,
    required this.peso,
    required this.color,
    required this.alineacion,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
