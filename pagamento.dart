import 'package:flutter/material.dart';
import 'package:qr_flutter/qrflutter.dart'; 

class TelaPagamento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela de Pagamento'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Escaneie o QR Code para pagamento',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              QrImage(
                data: "https://example.com/pagamento", 
                size: 200.0,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
