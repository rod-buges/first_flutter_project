import 'package:flutter/material.dart';

class Pesquisa extends StatefulWidget {
  const Pesquisa({super.key});

  @override
  State<Pesquisa> createState() => _PesquisaState();
}

class _PesquisaState extends State<Pesquisa> {
  final receita = TextEditingController();
  String? mensagemErro;
  String? termoPesquisado;

  // Remove espaços nas pontas e reduz espaços repetidos no meio a um só.
  String normalizar(String valor) {
    return valor.trim().replaceAll(RegExp(r'\s+'), ' ');
  }

  void validarReceita(String valor) {
    setState(() {
      if (normalizar(valor).isEmpty) {
        mensagemErro =
        "Digite o nome de uma receita, por exemplo: bolo de cenoura";
      } else {
        mensagemErro = null;
      }
    });
  }

  void pesquisar() {
    final termo = normalizar(receita.text);

    if (termo.isEmpty) {
      setState(() {
        mensagemErro =
        "Digite o nome de uma receita, por exemplo: bolo de cenoura";
        termoPesquisado = null; // consulta inválida não inicia pesquisa
      });
      return;
    }

    setState(() {
      mensagemErro = null;
      termoPesquisado = termo;
    });
  }

  @override
  void dispose() {
    receita.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pesquisar Receitas")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: receita,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                labelText: 'Nome da receita',
                hintText: 'Ex.: bolo de cenoura',
                errorText: mensagemErro,
                border: const OutlineInputBorder(),
              ),
              onChanged: (valor) {
                if (mensagemErro != null) validarReceita(valor);
              },
              onSubmitted: (_) => pesquisar(), // tecla Enter também pesquisa
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: pesquisar,
              icon: const Icon(Icons.search),
              label: const Text('Pesquisar'),
            ),
            const SizedBox(height: 24),
            if (termoPesquisado != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Você pesquisou por: $termoPesquisado',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 8),
                      const Text('Resultados: em breve (dados provisórios)'),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}