import 'package:first_flutter_project/Aula04/Lugar.dart';
import 'package:flutter/material.dart';

class DetalheLugar extends StatelessWidget {
  const DetalheLugar({super.key, required this.lugar});

  final Lugar lugar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lugar.nome)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              lugar.descricao ?? 'Descrição indisponível',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Voltar ao Guia"),
            ),
          ],
        ),
      ),
    );
  }
}