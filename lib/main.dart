import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:numeros_maya/estadomaya.dart';
import 'package:numeros_maya/interfaz/pantalla.dart';

import 'mayanum.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<Mayanum>(
        create: (context) => Mayanum(),
        child: AppWidget(),
      ),
    );
  }
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Mayanum, EstadoMaya>(builder: (context, estado) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Numeros maya"),
        ),
        body: Pantalla(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home),
          onPressed: () {
            print("boton cambiar pantalla");
            context.bloc<Mayanum>().cambiarPantalla();
          },
        ),
      );
    });
  }
}
