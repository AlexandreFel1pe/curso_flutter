import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacaoTotal;
  const Resultado({required this.pontuacaoTotal , super.key});

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
        children: [
          Text(
            'Parabéns!',
            style: TextStyle(fontSize: 28),
          ),
          Text(
            'Você fez:',
            style: TextStyle(fontSize: 28),
          ),
          Text(
            fraseResultado,
            style: TextStyle(
              fontSize: 36,
              color: Colors.blue,
            ),
          ),
          Text(
            'pontos!',
            style: TextStyle(fontSize: 24),
          ),
          ElevatedButton(
            onPressed: () {
              
            }, 
            child: Text('Reiniciar')
          ),
        ],
      ),
    );
  }
}