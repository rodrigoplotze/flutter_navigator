import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/material.dart';

import 'core/app_routes.dart';
import 'core/service_locator.dart';
import 'view/cadastrar_view.dart';
import 'view/exibir_view.dart';
import 'view/iniciar_view.dart';

void main() {
  configurarDependencias();

  runApp(DevicePreview(builder: ((context) => const MeuApp())));
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          filled: true,
        ),
      ),

      initialRoute: AppRoutes.inicio,

      routes: {
        AppRoutes.inicio: (context) => const InicioView(),
        AppRoutes.cadastrar: (context) => const CadastrarView(),
        AppRoutes.exibir: (context) => const ExibirView(),
      },

      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const InicioView());
      },
    );
  }
}
