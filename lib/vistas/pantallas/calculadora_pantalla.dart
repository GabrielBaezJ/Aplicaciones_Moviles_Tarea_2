import 'package:flutter/material.dart';

import '../../controladores/subred_controlador.dart';
import '../../modelos/subred_model.dart';
import '../organismos/calculadora_formulario_organismo.dart';

class CalculadoraPantalla extends StatefulWidget {
  final ValueChanged<SubredModelo>? onCalcular;

  const CalculadoraPantalla({super.key, this.onCalcular});

  @override
  State<CalculadoraPantalla> createState() => _CalculadoraPantallaState();
}

class _CalculadoraPantallaState extends State<CalculadoraPantalla> {
  final ipController = TextEditingController();
  final prefijoController = TextEditingController();
  final controlador = SubredControlador();

  String? errorIp;
  String? errorPrefijo;

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
    ipController.dispose();
    prefijoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
