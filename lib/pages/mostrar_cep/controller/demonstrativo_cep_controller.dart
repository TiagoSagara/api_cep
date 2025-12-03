import 'package:flutter/material.dart';

class TextError {
  Text textError() {
    return Text(
      'CEP inválido ou inexistente.\nPor favor, tente novamente.',
      style: TextStyle(color: Colors.blueGrey, fontSize: 16),
    );
  }
}
