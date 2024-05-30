import 'package:flutter/material.dart';
import 'cotacao_page.dart';
import 'trasnferencia.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MAURIBANK',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color.fromARGB(255, 0, 217, 255),
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
        color: const Color.fromARGB(
            255, 24, 27, 29), // Definindo a cor de fundo da página
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Adicionando a imagem da logo no corpo da página
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Image.asset(
                  'assets/imagens/logoMauribank.jpeg',
                  width: 200,
                  height: 200,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Bem-vindo ao MAURIBANK,\nEscolha uma opção para continuar:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(
                        255, 255, 255, 255), // Alterando a cor do texto
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Transferencia()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    'Realizar Pagamento',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CotacaoPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    'Simular Minha Cotação',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String title;

  const SecondPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Bem-vindo à tela $title',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
