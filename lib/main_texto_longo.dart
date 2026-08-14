import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: TextoLongo()));
}

class TextoLongo extends StatelessWidget {
  const TextoLongo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Texto Longo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(Icons.add_home_work, color: Colors.amber),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'Este será um texto longo para estouro de espaço de tela.',
                style: TextStyle(fontSize: 20),
                
              )
            )
          ]
        ),
      ),
    );
  }
}