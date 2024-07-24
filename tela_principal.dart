import 'package:flutter/material.dart';
import 'tela_cadastro.dart';
import 'tela_pagamento.dart';
import 'tela_palestras.dart';

class TelaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SETEC'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text('Cadastro'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaCadastro()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: Text('Palestras'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaPalestras()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Pagamento'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaPagamento()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Bem-vindo ao aplicativo SETEC!'),
      ),
    );
  }
}
