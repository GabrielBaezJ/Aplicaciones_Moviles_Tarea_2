import 'package:flutter/material.dart';

import '../../controladores/subred_controlador.dart';
import '../../modelos/subred_model.dart';
import '../organismos/calculadora_formulario_organismo.dart';

class CalculadoraPantalla extends StatefulWidget {
  // Resultado de la calculadora
  final ValueChanged<SubredModelo>? onCalcular;

  // Constructor
  const CalculadoraPantalla({super.key, this.onCalcular});

  @override
  State<CalculadoraPantalla> createState() => _CalculadoraPantallaState();
}

class _CalculadoraPantallaState extends State<CalculadoraPantalla> {
  // Instanciacion de clases
  final ipController = TextEditingController();
  final prefijoController = TextEditingController();
  final controlador = SubredControlador();

  String? errorIp;
  String? errorPrefijo;

  // Metodo calcular
  void calcular() {
    setState(() {
      errorIp = controlador.validarIp(ipController.text);
      errorPrefijo = controlador.validarPrefijo(prefijoController.text);
    });

    if (errorIp != null || errorPrefijo != null) {
      return;
    }

    try {
      final resultado = controlador.calcular(
        ipController.text,
        prefijoController.text,
      );
      widget.onCalcular?.call(resultado);
    } on FormatException catch (error) {
      setState(() {
        errorIp = error.message;
      });
    }
  }

  // Limpiar
  void limpiar() {
    ipController.clear();
    prefijoController.clear();
    setState(() {
      errorIp = null;
      errorPrefijo = null;
    });
  }

  @override
  void dispose() {
    // Liberar controladores
    ipController.dispose();
    prefijoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Diseno de la pantalla
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de red')),
      body: SingleChildScrollView(
        child: CalculadoraFormularioOrganismo(
          ipController: ipController,
          prefijoController: prefijoController,
          errorIp: errorIp,
          errorPrefijo: errorPrefijo,
          onCalcular: calcular,
          onLimpiar: limpiar,
        ),
      ),
    );
  }
}
