import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:numeros_maya/interfaz/Concha.dart';
import 'package:numeros_maya/interfaz/Linea.dart';
import 'package:numeros_maya/interfaz/Punto.dart';
import 'package:numeros_maya/interfaz/nivel.dart';

part 'estadomaya.freezed.dart';
//part 'estadomaya.g.dart';

@freezed
abstract class EstadoMaya with _$EstadoMaya {
  factory EstadoMaya(
      {@required bool pantallaMayaDecimal,
      @required bool pantallaDecimalMaya,
      @required int seleccionado,
      @required List<Punto> listaPuntos1,
      @required List<Punto> listaPuntos2,
      @required List<Punto> listaPuntos3,
      @required List<Linea> listaLinea1,
      @required List<Linea> listaLinea2,
      @required List<Linea> listaLinea3,
      Concha concha1,
      Concha concha2,
      Concha concha3,
      @required int randomMayadec,
      @required int randomNumber}) = _EstadoMaya;

  factory EstadoMaya.inicial() => EstadoMaya(
        pantallaMayaDecimal: true,
        pantallaDecimalMaya: false,
        seleccionado: 1,
        listaPuntos1: [],
        listaPuntos2: [],
        listaPuntos3: [],
        listaLinea1: [],
        listaLinea2: [],
        listaLinea3: [],
        randomNumber: Random().nextInt(8000),
        randomMayadec: Random().nextInt(401),
      );

  /*factory EstadoMaya.fromJson(Map<String, dynamic> json) =>
      _$EstadoMayaFromJson(json);*/
}
