import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:numeros_maya/estadomaya.dart';
import 'package:numeros_maya/interfaz/botones.dart';
import 'package:numeros_maya/interfaz/nivel.dart';
import 'package:numeros_maya/mayanum.dart';

class DecimalMaya extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Mayanum, EstadoMaya>(builder: (context, estado) {
      if (estado.randomMayadec % 20 == 0) {
        context.bloc<Mayanum>().generarNumeroVigesimal(estado.randomMayadec);
      } else {
        context.bloc<Mayanum>().generarMayaRandom();
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
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
                      context.bloc<Mayanum>().generarNuevoRandomMaya();
                    }),
              ),
            ],
          ),
          Expanded(
              child: Container(
            child: Column(
              children: [
                Nivel(
                    3, estado.listaPuntos3, estado.listaLinea3, estado.concha3),
                Nivel(
                    2, estado.listaPuntos2, estado.listaLinea2, estado.concha2),
                Nivel(
                    1, estado.listaPuntos1, estado.listaLinea1, estado.concha1),
              ],
            ),
          )),
          Expanded(
              child: Container(
            child: TextField(
              onSubmitted: (numero) {
                if (int.parse(numero) ==
                    context.bloc<Mayanum>().calcularNumeroMayaDecimal()) {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('El numero es corrrecto!')));
                } else {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('El numero no es correcto!')));
                }
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Cual es el numero?',
              ),
            ),
            color: Colors.green,
          )),
        ],
      );
    });
  }
}
