import 'package:flutter/material.dart';
import '../../modelos/subred_model.dart';
import '../organismos/resultado_organismo.dart';

class ResultadoPantalla extends StatelessWidget {
  const ResultadoPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    final SubredModelo redCalculada = ModalRoute.of(context)!.settings.arguments as SubredModelo;

    return Scaffold(
      backgroundColor: Colors.blue[50],
      
      appBar: AppBar(
        title: const Text(
          'Resultado de la Red',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue[800],
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            
            Expanded(
              child: ListView(
                children: [
                  ResultadoOrganismo(red: redCalculada),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                label: const Text(
                  'Volver a la calculadora',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800], 
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), 
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}