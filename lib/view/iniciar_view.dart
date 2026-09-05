import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controller/cadastrar_controller.dart';
import '../core/app_routes.dart';

class InicioView extends StatelessWidget {
  const InicioView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = GetIt.I.get<CadastrarController>();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SizedBox(
            width: 320,
            height: 52,
            child: FilledButton.icon(
              onPressed: () {
                ctrl.limpar();
                Navigator.pushNamed(context, AppRoutes.cadastrar);
              },
              icon: const Icon(Icons.person_add_alt_1),
              label: const Text('Cadastrar usuário'),
            ),
          ),
        ),
      ),
    );
  }
}
