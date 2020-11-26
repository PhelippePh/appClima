import 'dart:convert' as convert;
import 'dart:math';

import 'package:clima/componentes.dart';
import 'package:clima/models/clima.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ClimaModel climaModel;
  String cidade;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getClima();
  }

  Future<void> getClima() async {
    var url = "https://api.hgbrasil.com/weather?key=a83aafa5&city_name=$cidade";

    http.Response response = await http.get(url);
    var decodedJson = convert.jsonDecode(response.body);
    setState(() {
      climaModel = ClimaModel.fromJson(decodedJson);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (Container(
        padding: EdgeInsets.only(top: 80),
        width: 400,
        height: 800,
        color: Colors.indigo,
        child: (climaModel == null
            ? CircularProgressIndicator()
            : Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Componentes.rotulo(
                        climaModel.results.temp.toString() + "°C",
                        50,
                        Colors.white),
                    Componentes.rotulo(
                        climaModel.results.time, 27, Colors.black),
                    Componentes.rotulo(
                        climaModel.results.date, 27, Colors.black),
                    Componentes.rotulo(
                        climaModel.results.city, 47, Colors.white),
                    Componentes.rotulo(
                        climaModel.results.description, 38, Colors.black),
                    Componentes.rotulo(
                        "Está de " + climaModel.results.currently,
                        30,
                        Colors.black),
                    TextFormField(
                      onChanged: (value) {
                        cidade = value;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Digite a cidade",
                        labelStyle: TextStyle(fontSize: 20, color: Colors.red),
                        hintText: "",
                        hintStyle: TextStyle(fontSize: 17, color: Colors.red),
                      ),
                    ),
                    // Componentes.caixaDeTexto(
                    //     "Cidade", "Informe a cidade", controladorCity, null),
                    IconButton(
                      onPressed: getClima,
                      icon: FaIcon(
                        FontAwesomeIcons.search,
                        color: Colors.red,
                        size: 40,
                      ),
                    )
                  ],
                ),
              )),
      )),
    );
  }
}
