import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Transferencia extends StatefulWidget {
  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<Transferencia> {
  TextEditingController _controller = TextEditingController();
  double _saldo = 100.0;
  String _comprovante = '';

  void _transfer(double quantia, String type) {
    if (quantia > 0 && quantia <= _saldo) {
      setState(() {
        _saldo -= quantia;
        _comprovante =
            'Transferência $type de R\$ $quantia realizada com sucesso. Saldo atual: R\$ $_saldo';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Transferência $type realizada com sucesso')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Saldo insuficiente')),
      );
    }
  }

  void _compartilhar() {
    if (_comprovante.isNotEmpty) {
      Share.share(_comprovante);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferencia'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/imagens/logoMauribank.jpeg',
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: Container(
        color: Color.fromARGB(
            255, 32, 39, 43), // Definindo a cor de fundo como preto
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Saldo: R\$ $_saldo',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: const Color.fromARGB(255, 255, 255,
                          255)), // Mudando a cor do texto para branco
                ),
                Container(
                  width: 300,
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        color:
                            Colors.white), // Mudando a cor do texto para branco
                    decoration: InputDecoration(
                      hintText: 'Valor da Transferencia',
                      hintStyle: TextStyle(
                          color: Colors
                              .white54), // Mudando a cor do hint text para branco
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .white), // Mudando a cor da borda para branco
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .white), // Mudando a cor da borda quando habilitado para branco
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .blue), // Mudando a cor da borda quando focado para azul
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    double quantia = double.tryParse(_controller.text) ?? 0.0;
                    _transfer(quantia, 'TED');
                    _controller.clear();
                  },
                  child: Text(
                    'TED',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    double quantia = double.tryParse(_controller.text) ?? 0.0;
                    _transfer(quantia, 'DOC');
                    _controller.clear();
                  },
                  child: Text(
                    'DOC',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    double quantia = double.tryParse(_controller.text) ?? 0.0;
                    _transfer(quantia, 'PIX');
                    _controller.clear();
                  },
                  child: Text(
                    'PIX',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: _compartilhar,
                  child: Text(
                    'Compartilhar comprovante',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
                SizedBox(height: 20.0),
                if (_comprovante.isNotEmpty)
                  Text(
                    _comprovante,
                    style: TextStyle(fontSize: 16.0, color: Colors.blue),
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
