import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ExemploLista()));
}

class ExemploLista extends StatelessWidget {
  const ExemploLista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemplo ListView')),
      body: Column(
        children: [
          const Text(
            'List View'
          ),
          Expanded(
            child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(title: Text('Texto $index'));
            })
          )
        ],
      ),
    );
  }
}