import 'package:flutter/material.dart';

class NovaTela extends StatelessWidget {
  final String mensagem;

  const NovaTela({required this.mensagem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Tela'),
      ),
      body: Center(
        child: Text(mensagem),
      ),
    );
  }
}
