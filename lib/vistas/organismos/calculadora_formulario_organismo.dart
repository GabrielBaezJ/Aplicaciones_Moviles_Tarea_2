import 'package:flutter/material.dart';

class CalculadoraFormularioOrganismo extends StatelessWidget {
  final TextEditingController ipController;
  final TextEditingController prefijoController;
  final String? errorIp;
  final String? errorPrefijo;
  final VoidCallback onCalcular;
  final VoidCallback onLimpiar;

  const CalculadoraFormularioOrganismo({
    super.key,
    required this.ipController,
    required this.prefijoController,
    required this.errorIp,
    required this.errorPrefijo,
    required this.onCalcular,
    required this.onLimpiar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(24),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Datos de la red',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: ipController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Dirección IPv4',
                hintText: '192.168.1.130',
                prefixIcon: const Icon(Icons.language),
                errorText: errorIp,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: prefijoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Prefijo CIDR',
                hintText: '26',
                prefixIcon: const Icon(Icons.lan),
                errorText: errorPrefijo,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onCalcular,
              icon: const Icon(Icons.calculate),
              label: const Text('Calcular'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: onLimpiar,
              icon: const Icon(Icons.cleaning_services_outlined),
              label: const Text('Limpiar'),
            ),
          ],
        ),
      ),
    );
  }
}
