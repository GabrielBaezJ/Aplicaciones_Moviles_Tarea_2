import 'package:flutter/material.dart';
import '../../modelos/subred_model.dart';
import '../moleculas/resultado_molecula.dart';

class ResultadoOrganismo extends StatelessWidget {
  final SubredModelo red;

  const ResultadoOrganismo({super.key, required this.red});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ResultadoMolecula(etiqueta: 'Dirección IP:', valor: red.ipIngresada),
        ResultadoMolecula(etiqueta: 'Prefijo CIDR:', valor: '/${red.prefijo}'),
        ResultadoMolecula(etiqueta: 'Máscara de subred:', valor: red.mascara),
        ResultadoMolecula(etiqueta: 'Dirección de red:', valor: red.direccionRed),
        ResultadoMolecula(etiqueta: 'Broadcast:', valor: red.broadcast),
        ResultadoMolecula(etiqueta: 'Primera IP utilizable:', valor: red.primeraIpUtilizable),
        ResultadoMolecula(etiqueta: 'Última IP utilizable:', valor: red.ultimaIpUtilizable),
        ResultadoMolecula(etiqueta: 'Total de direcciones:', valor: red.totalDirecciones.toString()),
        ResultadoMolecula(etiqueta: 'Hosts utilizables:', valor: red.hostsUtilizables.toString()),
        ResultadoMolecula(etiqueta: 'Rango disponible:', valor: red.rangoHosts),
      ],
    );
  }
}