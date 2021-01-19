import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:numeros_maya/estadomaya.dart';
import 'package:numeros_maya/interfaz/decimalMaya.dart';
import 'package:numeros_maya/mayanum.dart';

import 'mayaDecimal.dart';

class Pantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Mayanum, EstadoMaya>(builder: (context, estado) {
      if (estado.pantallaMayaDecimal) {
        return MayaDecimal();
      }
      if (estado.pantallaDecimalMaya) {
        return DecimalMaya();
      }
      return Container();
    });
  }
}
