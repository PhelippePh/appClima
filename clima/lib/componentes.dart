import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Componentes {
  static rotulo(dynamic rotulo, double fontSize, Color color) {
    return Text(
      rotulo.toString(),
      style: TextStyle(
          color: color, fontWeight: FontWeight.bold, fontSize: fontSize),
    );
  }

  static caixaDeTexto(
      String rotulo, String dica, TextEditingController controlador, validacao,
      {bool obscure = false, bool numero = false}) {
    return TextFormField(
      controller: controlador,
      obscureText: obscure,
      validator: validacao,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: TextStyle(fontSize: 20),
        hintText: dica,
        hintStyle: TextStyle(fontSize: 15, color: Colors.red),
      ),
    );
  }

  static botao(String _text, Function _f) {
    return Container(
      child: RaisedButton(
        onPressed: _f,
        child: Text(
          _text,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.black, width: 4),
        ),
      ),
    );
  }
}
