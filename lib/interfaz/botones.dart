import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:numeros_maya/estadomaya.dart';
import 'package:numeros_maya/interfaz/Concha.dart';
import 'package:numeros_maya/interfaz/Linea.dart';
import 'package:numeros_maya/interfaz/Punto.dart';
import 'package:numeros_maya/mayanum.dart';

class Botones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Mayanum, EstadoMaya>(builder: (context, estado) {
      return Container(
        color: Colors.blueGrey,
        width: 150,
        height: 150,
        margin: EdgeInsets.fromLTRB(15, 15, 0, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: InkWell(
                      child: Punto(),
                      onTap: () {
                        context
                            .bloc<Mayanum>()
                            .agregarPunto(estado.seleccionado);
                      }),
                ),
                Container(
                  height: 50,
                  width: 50,
                  child: InkWell(
                      child: Linea(),
                      onTap: () {
                        context
                            .bloc<Mayanum>()
                            .agregarLinea(estado.seleccionado);
                      }),
                ),
                Container(
                  height: 50,
                  width: 50,
                  child: InkWell(
                    child: Concha(),
                    onTap: () {
                      context
                          .bloc<Mayanum>()
                          .agregarConcha(estado.seleccionado);
                    },
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: InkWell(
                      child: Punto(),
                      onTap: () {
                        context
                            .bloc<Mayanum>()
                            .quitarPunto(estado.seleccionado);
                      }),
                ),
                Container(
                  height: 50,
                  width: 50,
                  child: InkWell(
                      child: Linea(),
                      onTap: () {
                        context
                            .bloc<Mayanum>()
                            .quitarLinea(estado.seleccionado);
                      }),
                ),
                Container(
                  height: 50,
                  width: 50,
                  child: InkWell(
                    child: Concha(),
                    onTap: () {
                      context.bloc<Mayanum>().quitarConcha(estado.seleccionado);
                    },
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: InkWell(
                      child: Icon(Icons.healing_sharp),
                      onTap: () {
                        context.bloc<Mayanum>().generarNuevoRandom();
                      }),
                ),
                Container(
                  height: 50,
                  width: 50,
                  child: InkWell(
                      child: Icon(Icons.ac_unit),
                      onTap: () {
                        if (context.bloc<Mayanum>().checarCorrecto()) {
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('El numero es corrrecto!')));
                        } else {
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('El numero no es correcto!')));
                        }
                      }),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
