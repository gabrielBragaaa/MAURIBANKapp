import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _dateNasController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  bool _nomeError = false;
  bool _cpfError = false;
  bool _dateNasError = false;
  bool _emailError = false;
  bool _numeroError = false;
  bool _senhaError = false;

  void _login() {
    setState(() {
      _nomeError = _nomeController.text.isEmpty;
      _cpfError = _cpfController.text.isEmpty;
      _dateNasError = _dateNasController.text.isEmpty;
      _emailError = _emailController.text.isEmpty;
      _numeroError = _numeroController.text.isEmpty;
      _senhaError = _senhaController.text.isEmpty;
    });

    if (!_nomeError &&
        !_cpfError &&
        !_dateNasError &&
        !_emailError &&
        !_numeroError &&
        !_senhaError) {
      Navigator.pushNamed(context, '/homePage'); // Redireciona para a HomePage
    } else {
      final snackBar = SnackBar(
        content:
            const Text('Por favor, preencha todos os campos obrigatórios.'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 43, 44),
      appBar: AppBar(
        title: const Text('Criar conta'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          // Adicionado SingleChildScrollView para evitar problemas de layout em telas menores
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Vamos criar sua conta',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  width: 300,
                  child: TextField(
                    controller: _nomeController,
                    style: const TextStyle(color: Colors.black),
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      hintText: 'Nome Completo',
                      errorText:
                          _nomeError ? 'Por favor digite seu nome' : null,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  width: 300,
                  child: TextField(
                    controller: _cpfController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'CPF',
                      errorText: _cpfError ? 'Por favor digite seu CPF' : null,
                      border: const OutlineInputBorder(),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter
                          .digitsOnly, // Restringe apenas a números
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  color: const Color.fromARGB(255, 254, 255, 255),
                  width: 300,
                  child: TextField(
                    controller: _dateNasController,
                    keyboardType: TextInputType.datetime,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Data de nascimento',
                      errorText: _dateNasError
                          ? 'Por favor digite sua data de nascimento'
                          : null,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  width: 300,
                  child: TextField(
                    controller: _emailController,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'E-mail',
                      errorText:
                          _emailError ? 'Por favor digite seu Email' : null,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  width: 300,
                  child: TextField(
                    controller: _numeroController,
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Número de telefone',
                      errorText: _numeroError
                          ? 'Por favor digite seu número de telefone'
                          : null,
                      border: const OutlineInputBorder(),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter
                          .digitsOnly, // Restringe apenas a números
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  width: 300,
                  child: TextField(
                    controller: _senhaController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      errorText:
                          _senhaError ? 'Por favor crie sua senha' : null,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  child: const Text('Crie sua conta'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
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
