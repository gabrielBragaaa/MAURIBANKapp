import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CotacaoPage extends StatefulWidget {
  @override
  _CotacaoPageState createState() => _CotacaoPageState();
}

class _CotacaoPageState extends State<CotacaoPage> {
  double _dollarRate = 0.0;
  double _euroRate = 0.0;
  double _realAmount = 0.0;
  final TextEditingController _controller = TextEditingController();

  Future<void> _fetchExchangeRates() async {
    try {
      final response = await http
          .get(Uri.parse('https://api.exchangeratesapi.io/latest?base=USD'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data != null &&
            data['rates'] != null &&
            data['rates']['BRL'] != null &&
            data['rates']['EUR'] != null) {
          setState(() {
            _dollarRate = data['rates']['BRL'];
            _euroRate = data['rates']['EUR'];
          });
        } else {
          _setFallbackValues();
        }
      } else {
        _setFallbackValues();
      }
    } catch (e) {
      _setFallbackValues();
    }
  }

  void _setFallbackValues() {
    setState(() {
      _dollarRate = 5.20;
      _euroRate = 6.20;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchExchangeRates();
  }

  void _convertToDollarAndEuro(double amount) {
    setState(() {
      _realAmount = amount;
    });
  }

  void _clearData() {
    setState(() {
      _realAmount = 0;
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    double dollarAmount = _realAmount / _dollarRate;
    double euroAmount = _realAmount / _euroRate;

    return Scaffold(
      appBar: AppBar(
        title: Text('Conversor de Moedas'),
        backgroundColor: Color.fromARGB(255, 0, 153, 255),
      ),
      body: Container(
        color: const Color.fromARGB(255, 24, 27, 29),
        child: Center(
          child: Container(
            width: 300,
            height: 500,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue,
                  blurRadius: 10,
                  offset: Offset(4, 4),
                )
              ],
              border: Border.all(color: Colors.black12, width: 2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Digite o valor em reais',
                  ),
                  onChanged: (value) {
                    _convertToDollarAndEuro(double.tryParse(value) ?? 0.0);
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _clearData,
                  child: Text("Limpar dados"),
                ),
                SizedBox(height: 20),
                Container(
                  width: 200,
                  height: 200,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 131, 229, 241),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                          'Valor em Dólar: \$${dollarAmount.toStringAsFixed(2)}'),
                      SizedBox(height: 20),
                      Text('Valor em Euro: €${euroAmount.toStringAsFixed(2)}'),// "toStringAsFixed" faz a coversao em duas casas decimais.
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
