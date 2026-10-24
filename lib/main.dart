import 'package:flutter/material.dart';

import 'vistas/pantallas/login_pantalla.dart';
import 'vistas/pantallas/resultado_pantalla.dart';
import 'vistas/pantallas/calculadora_pantalla.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora de Subredes',
      
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
      ),
      
      initialRoute: '/login',
      
      // Mapa de rutas 
      routes: {
        '/login': (context) => const LoginPantalla(),
        '/calculadora': (context) => const CalculadoraPantalla(),
        '/resultado': (context) => const ResultadoPantalla(),
      },
    );
  }
}