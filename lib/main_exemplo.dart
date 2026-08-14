import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ExemploLayout()));
}

class ExemploLayout extends StatelessWidget {
  const ExemploLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Texto da AppBar'),
      ),
      body: Container(
        color: Colors.grey.shade300,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _construirBloco(Colors.red, 'Texto 1'),
            _construirBloco(Colors.blue, 'Texto 2'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _construirBloco(Colors.amber, 'Texto 3'),
                _construirBloco(Colors.green, 'Text 4')
              ],
            )
          ],
        ),
      )
    );
  }

  Widget _construirBloco(Color cor, String texto) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(texto)
    );
  }
}