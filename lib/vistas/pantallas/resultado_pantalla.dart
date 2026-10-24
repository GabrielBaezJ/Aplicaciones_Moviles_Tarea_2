import 'package:flutter/material.dart';
import '../../modelos/subred_model.dart';
import '../organismos/resultado_organismo.dart';

class ResultadoPantalla extends StatelessWidget {
  const ResultadoPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    // Se extrae el modelo de red que el controlador envió al cambiar de pantalla
    final SubredModelo redCalculada = ModalRoute.of(context)!.settings.arguments as SubredModelo;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado de la Red'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Detalles Técnicos',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            // Llamada al organismo pasándole los datos
            Expanded(
              child: ListView(
                children: [
                  ResultadoOrganismo(red: redCalculada),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Volver a la calculadora'),
            ),
          ],
        ),
      ),
    );
  }
}