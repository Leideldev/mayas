import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:numeros_maya/estadomaya.dart';
import 'package:numeros_maya/interfaz/Concha.dart';
import 'package:numeros_maya/interfaz/Linea.dart';
import 'package:numeros_maya/interfaz/Punto.dart';
import 'package:numeros_maya/mayanum.dart';

class Nivel extends StatelessWidget {
  int nivel;
  List<Punto> lista;
  List<Linea> linea;
  Concha concha;
  Nivel(this.nivel, this.lista, this.linea, this.concha);
  Widget usado;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Mayanum, EstadoMaya>(builder: (context, estado) {
      if (concha != null) {
        usado = InkWell(
          child: Container(
            color: Colors.white,
            width: 150,
            margin: EdgeInsets.fromLTRB(15, 15, 0, 15),
            child: Column(
              children: [
                Container(
                  child: concha,
                )
              ],
            ),
          ),
          onTap: () {
            context.bloc<Mayanum>().cambiarSeleccionado(nivel);
          },
        );
      } else {
        usado = InkWell(
          child: Container(
            color: Colors.white,
            width: 150,
            margin: EdgeInsets.fromLTRB(15, 15, 0, 15),
            child: Column(
              children: [
                Row(
                  children: lista,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
                Column(
                  children: linea,
                ),
              ],
            ),
          ),
          onTap: () {
            context.bloc<Mayanum>().cambiarSeleccionado(nivel);
          },
        );
      }
      return Expanded(child: usado);
    });
  }
}
