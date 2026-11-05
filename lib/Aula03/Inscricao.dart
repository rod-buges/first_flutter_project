import 'package:flutter/material.dart';

class Inscricao extends StatefulWidget {
  const Inscricao({super.key});

  @override
  State<Inscricao> createState() => _InscricaoState();
}

class _InscricaoState extends State<Inscricao> {
  final nome = TextEditingController(); //controler nao pode ser alterada
  String? mensagemErro;

  void validarNome (String valor){
    setState(() {
      if(valor.trim().isEmpty){
        mensagemErro = "Informe o seu nome: ";
      }else if(valor.trim().length<3){
        mensagemErro = "Informe ao menos 3 caracteres: ";
      } else {
        mensagemErro = null;
      }
    });
  }

  void inscrever(){
    validarNome(nome.text);
    if(mensagemErro != null) return;

    final texto = nome.text.trim();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Inscrição Recebida: $texto")),
    );

    nome.clear();
  }

  @override
  void dispose() {
    nome.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Palestra")
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column( //filho caixa
          children: [ //filho do filho
            TextField(
              controller: nome,
              decoration: InputDecoration(
                labelText: 'Nome Completo',
                errorText: mensagemErro,
                border: const OutlineInputBorder()
              ),
              onChanged: (valor){
                if (mensagemErro != null) validarNome(valor);
              },
            ),
            FilledButton(
                onPressed: inscrever,
                child: Text('Inscrever')
            )
          ],
        ),
      )
    );
  }
}
