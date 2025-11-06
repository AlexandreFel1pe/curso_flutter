import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function() responder;

  const Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
    super.key
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
    ? perguntas[perguntaSelecionada]['respostas'] as List<String>
    : List.empty();

    return Column(
      children: [
          Questao('${perguntas[perguntaSelecionada]['texto']}'),
          ...respostas.map((t) => Resposta(t, responder)),
        ],
      );
  }
}