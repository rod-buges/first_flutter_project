import 'package:first_flutter_project/Aula04/DetalheLugar.dart';
import 'package:first_flutter_project/Aula04/Lugar.dart';
import 'package:flutter/material.dart';

class Guia extends StatelessWidget {
  const Guia({super.key});

  @override
  Widget build(BuildContext context) {
    const lugar = Lugar(
      'Jardim Botânico',
      'Trilhas e espaços verdes.',
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Guia de Cidade")),
      body: Center(
        child: FilledButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetalheLugar(lugar: lugar),
              ),
            );
          },
          child: Text(lugar.nome),
        ),
      ),
    );
  }
}