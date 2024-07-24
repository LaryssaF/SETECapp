import 'package:flutter/material.dart';

class TelaPagamento extends StatefulWidget {
  @override
  _TelaPagamentoState createState() => _TelaPagamentoState();
}

class _TelaPagamentoState extends State<TelaPagamento> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardHolderController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela de Pagamento'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/logo.png',
                  height: 100,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _cardNumberController,
                  decoration: InputDecoration(
                    labelText: 'Número do Cartão',
                    prefixIcon: Icon(Icons.credit_card),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o número do cartão';
                    }
                    if (value.length < 13 || value.length > 19) {
                      return 'Número de cartão inválido';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _cardHolderController,
                  decoration: InputDecoration(
                    labelText: 'Nome do Titular',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o nome do titular';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _expiryDateController,
                  decoration: InputDecoration(
                    labelText: 'Data de Validade (MM/AA)',
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a data de validade';
                    }
                    if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(value)) {
                      return 'Formato inválido. Use MM/AA';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _cvvController,
                  decoration: InputDecoration(
                    labelText: 'Código de Segurança',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o código de segurança';
                    }
                    if (value.length != 3) {
                      return 'Código de segurança inválido';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Pagamento realizado com sucesso!')),
                      );
                    }
                  },
                  child: Text('Pagar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
