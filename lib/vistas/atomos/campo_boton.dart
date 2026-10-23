import 'package:flutter/material.dart';

class CampoBoton extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;
  final IconData? icono;
  final bool secundario;
  final Color color;

  const CampoBoton({
    super.key,
    required this.texto,
    required this.onPressed,
    this.icono,
    this.secundario = false,
    this.color = const Color(0xFF1565C0),
  });

  @override
  Widget build(BuildContext context) {
    final contenido = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icono != null) ...[Icon(icono, size: 20), SizedBox(width: 8)],
        Text(
          texto,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );

    final forma = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
    );

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: secundario
          // Botón secundario (contorno)
          ? OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: color,
                side: BorderSide(color: color, width: 1.5),
                shape: forma,
              ),
              onPressed: onPressed,
              child: contenido,
            )
          // Botón principal (relleno)
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                elevation: 3,
                shape: forma,
              ),
              onPressed: onPressed,
              child: contenido,
            ),
    );
  }
}
