import 'package:flutter/material.dart';
import 'package:flutter_application_4/cotacao_page.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'cadastro_page.dart';
import 'nova_tela.dart';
import 'trasnferencia.dart';

void main() {
  runApp(BancoApp());
}

class BancoApp extends StatelessWidget {
  const BancoApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MAURIBANK',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.blueAccent),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TelaLogin(),
        '/telaCadastro': (context) => TelaCadastro(),
        '/novaTela': (context) => NovaTela(mensagem: 'Bem-vindo(a)!'),
        '/homePage': (context) => HomePage(),
        '/cotacaoPage': (context) => CotacaoPage(),
        '/transferencia': (context) => Transferencia(),
      },
    );
  }
}
