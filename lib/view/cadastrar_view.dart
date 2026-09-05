import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controller/cadastrar_controller.dart';
import '../core/app_routes.dart';

class CadastrarView extends StatefulWidget {
  const CadastrarView({super.key});

  @override
  State<CadastrarView> createState() => _CadastrarViewState();
}

class _CadastrarViewState extends State<CadastrarView> {
 final ctrl = GetIt.I.get<CadastrarController>();

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>();

  late final TextEditingController _nomeController;
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();

    _nomeController = TextEditingController(
      text: ctrl.nome,
    );

    _emailController = TextEditingController(
      text: ctrl.email,
    );
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  void _salvar() {
    FocusScope.of(context).unfocus();

    final formularioValido =
        _formKey.currentState?.validate() ?? false;

    if (!formularioValido) {
      return;
    }

    Navigator.pushNamed(
      context,
      AppRoutes.exibir,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar'),
      ),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: ctrl,
          builder: (context, child) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 500,
                  ),
                  child: Card(
                    elevation: 0,
                    color: Theme.of(context)
                        .colorScheme
                        .surfaceContainerLow,
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.stretch,
                          children: [
                            Icon(
                              Icons.person_add_alt_1,
                              size: 64,
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary,
                            ),

                            const SizedBox(height: 16),

                            Text(
                              'Dados do usuário',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall,
                            ),

                            const SizedBox(height: 8),

                            Text(
                              'Preencha os campos abaixo para continuar.',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium,
                            ),

                            const SizedBox(height: 32),

                            TextFormField(
                              controller: _nomeController,
                              textInputAction:
                                  TextInputAction.next,
                              textCapitalization:
                                  TextCapitalization.words,
                              decoration: const InputDecoration(
                                labelText: 'Nome',
                                hintText: 'Digite seu nome',
                                prefixIcon:
                                    Icon(Icons.person_outline),
                              ),
                              onChanged:
                                  ctrl.alterarNome,
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty) {
                                  return 'Informe o nome.';
                                }

                                if (value.trim().length < 3) {
                                  return 'O nome deve ter pelo menos 3 caracteres.';
                                }

                                return null;
                              },
                            ),

                            const SizedBox(height: 16),

                            TextFormField(
                              controller: _emailController,
                              keyboardType:
                                  TextInputType.emailAddress,
                              textInputAction:
                                  TextInputAction.done,
                              autocorrect: false,
                              decoration: const InputDecoration(
                                labelText: 'E-mail',
                                hintText: 'nome@exemplo.com',
                                prefixIcon:
                                    Icon(Icons.email_outlined),
                              ),
                              onChanged:
                                  ctrl.alterarEmail,
                              onFieldSubmitted: (_) => _salvar(),
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty) {
                                  return 'Informe o e-mail.';
                                }

                                final emailValido = RegExp(
                                  r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                                ).hasMatch(value.trim());

                                if (!emailValido) {
                                  return 'Informe um e-mail válido.';
                                }

                                return null;
                              },
                            ),

                            const SizedBox(height: 16),

                            SwitchListTile(
                              contentPadding: EdgeInsets.zero,
                              title: const Text(
                                'Receber notificações',
                              ),
                              subtitle: Text(
                                ctrl.receberNotificacoes
                                    ? 'As notificações estão ativadas.'
                                    : 'As notificações estão desativadas.',
                              ),
                              secondary: Icon(
                                ctrl.receberNotificacoes
                                    ? Icons.notifications_active_outlined
                                    : Icons.notifications_off_outlined,
                              ),
                              value:
                                  ctrl.receberNotificacoes,
                              onChanged: ctrl
                                  .alterarReceberNotificacoes,
                            ),

                            const SizedBox(height: 32),

                            FilledButton.icon(
                              onPressed: _salvar,
                              icon: const Icon(Icons.save_outlined),
                              label: const Text(
                                'Salvar e exibir',
                              ),
                            ),

                            const SizedBox(height: 12),

                            OutlinedButton.icon(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back),
                              label: const Text(
                                'Voltar para o início',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}