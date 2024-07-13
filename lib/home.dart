import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController cepController = TextEditingController();
  String rua = "", bairro = "" , uf = "";

  void getCep() async {
    String url = "https://viacep.com.br/ws/" + cepController.text + "/json";
    http.Response response = await http.get(Uri.parse(url));
    print(response.statusCode.toString());
    print(response.body);

    Map<String, dynamic> cepData = jsonDecode(response.body);

    rua = cepData["logradouro"];
    bairro = cepData["bairro"];
    uf = cepData["uf"];

    setState(() {
      
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Via Cep App"),),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: cepController
              ),
              ElevatedButton(
                onPressed: getCep,
                child: Text("Consultar")
              ),
              Text("Rua: $rua",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              Text("Bairro: $bairro",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              Text("UF: $uf",
                style: TextStyle(
                  fontSize: 20
                ),
              )
              ],) ,
        ),
      ),
    );
  }
}