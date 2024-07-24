import 'package:flutter/material.dart';
import 'package:setecapp/tela_pagamento.dart'; 

class TelaPalestras extends StatefulWidget {
  @override
  _TelaPalestrasState createState() => _TelaPalestrasState();
}

class _TelaPalestrasState extends State<TelaPalestras> {
  final List<Palestra> _palestras = [
    Palestra(
      titulo: 'Inovações em Tecnologia',
      descricao: 'Exploração das últimas inovações em tecnologia e como elas estão moldando o futuro.',
      horario: '10:00 - 11:00',
      palestrante: 'Dr. Ana Souza',
    ),
    Palestra(
      titulo: 'Transformação Digital',
      descricao: 'Como as empresas estão se adaptando à transformação digital e as melhores práticas para a implementação.',
      horario: '11:15 - 12:15',
      palestrante: 'Carlos Oliveira',
    ),
    Palestra(
      titulo: 'Segurança da Informação',
      descricao: 'Estratégias e ferramentas para garantir a segurança da informação em um mundo digital.',
      horario: '13:00 - 14:00',
      palestrante: 'Luana Pereira',
    ),
    Palestra(
      titulo: 'Inteligência Artificial e Machine Learning',
      descricao: 'Uma visão geral sobre o impacto da inteligência artificial e do machine learning nas indústrias.',
      horario: '14:15 - 15:15',
      palestrante: 'Pedro Silva',
    ),
    Palestra(
      titulo: 'O Futuro da Programação',
      descricao: 'Tendências futuras em programação e como se preparar para as mudanças no mercado.',
      horario: '15:30 - 16:30',
      palestrante: 'Mariana Costa',
    ),
  ];

  final Set<Palestra> _selecionadas = Set<Palestra>();

  double get _custoTotal => _selecionadas.length * 2.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Palestras do Evento'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: _palestras.map((palestra) {
                return CheckboxListTile(
                  title: Text(
                    palestra.titulo,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 8.0),
                      Text(
                        palestra.descricao,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.green[700],
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Horário: ${palestra.horario}',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'Palestrante: ${palestra.palestrante}',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  value: _selecionadas.contains(palestra),
                  onChanged: (bool? selecionado) {
                    setState(() {
                      if (selecionado == true) {
                        _selecionadas.add(palestra);
                      } else {
                        _selecionadas.remove(palestra);
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Custo Total: R\$ ${_custoTotal.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _custoTotal > 0
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TelaPagamento()),
                          );
                        }
                      : null,
                  child: Text('Pagar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Palestra {
  final String titulo;
  final String descricao;
  final String horario;
  final String palestrante;

  Palestra({
    required this.titulo,
    required this.descricao,
    required this.horario,
    required this.palestrante,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Palestra &&
          runtimeType == other.runtimeType &&
          titulo == other.titulo &&
          descricao == other.descricao &&
          horario == other.horario &&
          palestrante == other.palestrante;

  @override
  int get hashCode =>
      titulo.hashCode ^
      descricao.hashCode ^
      horario.hashCode ^
      palestrante.hashCode;
}
