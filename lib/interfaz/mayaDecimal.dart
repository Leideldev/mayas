import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:numeros_maya/estadomaya.dart';
import 'package:numeros_maya/interfaz/botones.dart';
import 'package:numeros_maya/interfaz/nivel.dart';
import 'package:numeros_maya/mayanum.dart';

class MayaDecimal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Mayanum, EstadoMaya>(builder: (context, estado) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Column(
            children: [Botones()],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          )),
          Expanded(
              child: Container(
            child: Column(
              children: [
                Nivel(3, estado.listaPuntos3, estado.listaLinea3),
                Nivel(2, estado.listaPuntos2, estado.listaLinea2),
                Nivel(1, estado.listaPuntos1, estado.listaLinea1),
              ],
            ),
            color: Colors.blue,
          )),
          Expanded(
              child: Container(
            child: Text('El numero a representar es el ${estado.randomNumber}'),
            color: Colors.green,
          )),
        ],
      );
    });
  }
}
