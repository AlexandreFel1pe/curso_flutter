import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacaoTotal;
  final void Function() reiniciarQuestionario;
  const Resultado({required this.pontuacaoTotal, required this.reiniciarQuestionario , super.key});

  String get fraseResultado {
    if (pontuacaoTotal < 8) {
      return 'Parabéns!';
    } else if (pontuacaoTotal < 16) {
      return 'Impressionante!';
    } else {
      return 'Nivel Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            fraseResultado,
            style: TextStyle(
              fontSize: 28,
              color: Colors.blue,
            ),
          ),
          Text(
            'Você fez: $pontuacaoTotal pontos.',
            style: TextStyle(
              fontSize: 32,
              color: Colors.red,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              reiniciarQuestionario();
            }, 
            child: Text('Reiniciar')
          ),
        ],
      ),
    );
  }
}