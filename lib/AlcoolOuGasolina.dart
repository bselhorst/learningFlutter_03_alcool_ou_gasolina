// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AlcoolOuGasolina extends StatefulWidget {
  const AlcoolOuGasolina({super.key});

  @override
  State<AlcoolOuGasolina> createState() => _AlcoolOuGasolinaState();
}

class _AlcoolOuGasolinaState extends State<AlcoolOuGasolina> {
  TextEditingController _precoAlcool = TextEditingController();
  TextEditingController _precoGasolina = TextEditingController();
  var _resultado = "";
  var resultado = "";

  void _calcular() {
    double? precoAlcool = double.tryParse(_precoAlcool.text);
    double? precoGasolina = double.tryParse(_precoGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      resultado = "Número inválido, digite números maiores que 0 e com (.)";
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        resultado = "Vale a pena";
      } else {
        resultado = "Não vale a pena";
      }
    }

    setState(() {
      _resultado = resultado;
    });

    limparCampos();

    print(precoAlcool);
  }

  void limparCampos() {
    _precoAlcool.text = "";
    _precoGasolina.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou Gasolina"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 32),
                  child: Image.asset("images/logo.png"),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Text(
                    "Saiba qual a melhor opção para o abastecimento do seu carro",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _precoAlcool,
                  decoration: InputDecoration(
                    labelText: "Preço Alcool, ex: 1.59",
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _precoGasolina,
                  decoration: InputDecoration(
                    labelText: "Preço Gasolina, ex: 3.15",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(24),
                    ),
                    onPressed: _calcular,
                    child: Text(
                      "Calcular",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      _resultado,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
