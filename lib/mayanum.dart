import 'dart:math';

import 'package:cubit_form/cubit_form.dart';
import 'package:numeros_maya/estadomaya.dart';
import 'package:numeros_maya/interfaz/Concha.dart';
import 'package:numeros_maya/interfaz/Linea.dart';
import 'package:numeros_maya/interfaz/Punto.dart';
import 'package:numeros_maya/interfaz/nivel.dart';

class Mayanum extends Cubit<EstadoMaya> {
  Mayanum() : super(EstadoMaya.inicial());

  cambiarPantalla() {
    if (state.pantallaDecimalMaya) {
      state.listaLinea1.clear();
      state.listaLinea2.clear();
      state.listaLinea3.clear();
      state.listaPuntos1.clear();
      state.listaPuntos2.clear();
      state.listaPuntos3.clear();
      emit(state.copyWith(
        pantallaDecimalMaya: false,
        pantallaMayaDecimal: true,
      ));
    } else {
      emit(state.copyWith(
        pantallaDecimalMaya: true,
        pantallaMayaDecimal: false,
      ));
    }
  }

  agregarPunto(int seleccionado) {
    List<Punto> lista = [];
    if (state.listaPuntos1.length == 4) {
      emit(state.copyWith(listaPuntos1: state.listaPuntos1));
    } else {
      if (seleccionado == 1) {
        lista.add(Punto());
        lista.addAll(state.listaPuntos1);
        emit(state.copyWith(listaPuntos1: lista));
      }
    }
    if (state.listaPuntos2.length == 4) {
      emit(state.copyWith(listaPuntos2: state.listaPuntos2));
    } else {
      if (seleccionado == 2) {
        lista.add(Punto());
        lista.addAll(state.listaPuntos2);
        emit(state.copyWith(listaPuntos2: lista));
      }
    }
    if (state.listaPuntos3.length == 4) {
      emit(state.copyWith(listaPuntos3: state.listaPuntos3));
    } else {
      if (seleccionado == 3) {
        lista.add(Punto());
        lista.addAll(state.listaPuntos3);
        emit(state.copyWith(listaPuntos3: lista));
      }
    }
  }

  quitarPunto(int seleccionado) {
    List<Punto> lista = [];
    if (state.listaPuntos1.length == 0) {
      emit(state.copyWith(listaPuntos1: state.listaPuntos1));
    } else {
      if (seleccionado == 1) {
        lista.addAll(state.listaPuntos1);
        lista.removeLast();
        emit(state.copyWith(listaPuntos1: lista));
      }
    }
    if (state.listaPuntos2.length == 0) {
      emit(state.copyWith(listaPuntos2: state.listaPuntos2));
    } else {
      if (seleccionado == 2) {
        lista.addAll(state.listaPuntos2);
        lista.removeLast();
        emit(state.copyWith(listaPuntos2: lista));
      }
    }
    if (state.listaPuntos3.length == 0) {
      emit(state.copyWith(listaPuntos3: state.listaPuntos3));
    } else {
      if (seleccionado == 3) {
        lista.addAll(state.listaPuntos3);
        lista.removeLast();
        emit(state.copyWith(listaPuntos3: lista));
      }
    }
  }

  agregarLinea(int seleccionado) {
    List<Linea> lista = [];
    if (state.listaLinea1.length == 3) {
      emit(state.copyWith(listaLinea1: state.listaLinea1));
    } else {
      if (seleccionado == 1) {
        lista.add(Linea());
        lista.addAll(state.listaLinea1);
        emit(state.copyWith(listaLinea1: lista));
      }
    }
    if (state.listaLinea2.length == 3) {
      emit(state.copyWith(listaLinea2: state.listaLinea2));
    } else {
      if (seleccionado == 2) {
        lista.add(Linea());
        lista.addAll(state.listaLinea2);
        emit(state.copyWith(listaLinea2: lista));
      }
    }
    if (state.listaLinea3.length == 3) {
      emit(state.copyWith(listaLinea3: state.listaLinea3));
    } else {
      if (seleccionado == 3) {
        lista.add(Linea());
        lista.addAll(state.listaLinea3);
        emit(state.copyWith(listaLinea3: lista));
      }
    }
  }

  quitarLinea(int seleccionado) {
    List<Linea> lista = [];
    if (state.listaLinea1.length == 0) {
      emit(state.copyWith(listaLinea1: state.listaLinea1));
    } else {
      if (seleccionado == 1) {
        lista.addAll(state.listaLinea1);
        lista.removeLast();
        emit(state.copyWith(listaLinea1: lista));
      }
    }
    if (state.listaLinea2.length == 0) {
      emit(state.copyWith(listaLinea2: state.listaLinea2));
    } else {
      if (seleccionado == 2) {
        lista.addAll(state.listaLinea2);
        lista.removeLast();
        emit(state.copyWith(listaLinea2: lista));
      }
    }
    if (state.listaLinea3.length == 0) {
      emit(state.copyWith(listaLinea3: state.listaLinea3));
    } else {
      if (seleccionado == 3) {
        lista.addAll(state.listaLinea3);
        lista.removeLast();
        emit(state.copyWith(listaLinea3: lista));
      }
    }
  }

  cambiarSeleccionado(int nivel) {
    emit(state.copyWith(seleccionado: nivel));
    calcularNumeroMayaDecimal();
  }

  calcularNumeroMayaDecimal() {
    int valorNivel1 =
        (state.listaLinea1.length * 5) + (state.listaPuntos1.length * 1);
    int valorNivel2 =
        ((state.listaLinea2.length * 5) + (state.listaPuntos2.length * 1)) * 20;
    int valorNivel3 =
        ((state.listaLinea3.length * 5) + (state.listaPuntos3.length * 1)) *
            400;
    print("El valor es ${valorNivel1 + valorNivel2 + valorNivel3}");
    return valorNivel1 + valorNivel2 + valorNivel3;
  }

  generarNuevoRandom() {
    emit(state.copyWith(randomNumber: Random().nextInt(8000)));
  }

  checarCorrecto() {
    if (state.randomNumber == calcularNumeroMayaDecimal()) {
      return true;
    }
    return false;
  }

  generarNumeroVigesimal(int numeroMaya) {
    if (state.randomNumber == 400) {
      state.listaPuntos3.add(Punto());
      emit(state.copyWith(concha1: Concha(), concha2: Concha()));
      return;
    }
    int numeroDividido = numeroMaya ~/ 20;
    int lineas = calcularLineas(numeroDividido);
    int puntos = numeroDividido - (lineas * 5);
    for (var i = 0; i < puntos; i++) {
      state.listaPuntos2.add(Punto());
    }
    for (var i = 0; i < lineas; i++) {
      state.listaLinea2.add(Linea());
    }
    emit(state.copyWith());
  }

  generarMayaRandom() {
    int numeroSuertudo = 5;
    int puntosMaximo = 4;
    int lineasMaximo = 3;
    state.listaLinea1.clear();
    state.listaLinea2.clear();
    state.listaLinea3.clear();
    state.listaPuntos1.clear();
    state.listaPuntos2.clear();
    state.listaPuntos3.clear();
    for (var i = 0; i < puntosMaximo; i++) {
      if (Random().nextInt(6) == numeroSuertudo &&
          state.listaPuntos2.length < 4) {
        state.listaPuntos2.add(Punto());
      }
    }
    for (var i = 0; i < lineasMaximo; i++) {
      if (Random().nextInt(6) == numeroSuertudo &&
          state.listaLinea2.length < 3) {
        state.listaLinea2.add(Linea());
      }
      for (var i = 0; i < puntosMaximo; i++) {
        if (Random().nextInt(6) == numeroSuertudo &&
            state.listaPuntos1.length < 4) {
          state.listaPuntos1.add(Punto());
        }
      }
      for (var i = 0; i < lineasMaximo; i++) {
        if (Random().nextInt(6) == numeroSuertudo &&
            state.listaLinea1.length < 3) {
          state.listaLinea1.add(Linea());
        }
      }
    }
  }

  calcularLineas(int numeroDivido) {
    return numeroDivido ~/ 5;
  }
}
