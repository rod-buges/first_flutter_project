import 'package:first_flutter_project/Aula03/Inscricao.dart';
import 'package:first_flutter_project/Aula03/Pesquisa.dart';
import 'package:flutter/material.dart';

class Aula03 extends StatelessWidget{
  const Aula03({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Pesquisa(),
    );
  }
}
