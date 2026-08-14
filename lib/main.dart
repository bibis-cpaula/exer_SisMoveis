import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: TelaExercicio1())); // Nomeia a Págia
} // Renderiza o widget fornecido na tela do dispositivo e inicializa a árvore de componentes do Flutter.
// MaterialApp é a raiz do app

class TelaExercicio1 extends StatelessWidget { // State puxado do pacote SDK do flutter
  const TelaExercicio1({super.key}); // Construtor
// Flutter reaproveita a mesma instância na memória em vez de gastar processamento recriando o widget do zero toda vez que a tela for atualizada
// Key é o identificado q o flutte usa para saber qual widget é na arvores de componentes

  @override
  Widget build(BuildContext context) { // contrutor
    return Scaffold( //é um widget especial do Material Design que serve como o esqueleto completo de uma tela de aplicativo
  //você ganha uma estrutura pronta com espaços pré-definidos para os elementos mais comuns de um aplicativo mobile
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(title: const Text('Exercício 1 - Cartão do Investidor')),
      body: Padding( // Aqui vai o Colum tbm
        padding: const EdgeInsets.all(16),
        child: CartaoInvestidor(
          nome: 'João da Silva',
          resumo: 'Perfil Focado em Ativos Internacionais e Dividendos',
          risco: 'Arrojado',
        ),
      ),
    );
  }
}

class CartaoInvestidor extends StatelessWidget {
  final String nome;
  final String resumo;
  final String risco;

  const CartaoInvestidor({
    super.key,
    required this.nome,
    required this.resumo,
    required this.risco,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1B1B3A), // azul bem escuro
        borderRadius: BorderRadius.circular(16),
      ),
      // Row = alinha os itens horizontalmente: avatar | nome/resumo | badge
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ---- Avatar com indicador de status online ----
          // Stack sobrepõe widgets. Aqui usamos para colocar a bolinha
          // verde por cima do canto inferior direito do avatar.
          Stack(
            children: [
              const CircleAvatar(
                radius: 28,
                backgroundColor: Colors.blueAccent,
                child: Text(
                  'JS',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    // borda da cor do fundo do cartão, para "recortar"
                    // a bolinha do avatar visualmente
                    border: Border.all(
                      color: const Color(0xFF1B1B3A),
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 12),

          // ---- Nome + resumo (parte flexível que pode quebrar linha) ----
          // Expanded é ESSENCIAL aqui: ele diz para essa Column ocupar
          // apenas o espaço restante entre o avatar e o badge, permitindo
          // que o texto do resumo quebre linha (wrap) em vez de estourar
          // a tela em celulares menores.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  nome,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  resumo,
                  // sem "maxLines", o Text já quebra linha naturalmente
                  // dentro do espaço que o Expanded oferece
                  style: TextStyle(color: Colors.grey.shade300, fontSize: 13),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // ---- Badge de nível de risco (fica fixo, não é afetado
          // pelo Expanded acima) ----
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              risco,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
