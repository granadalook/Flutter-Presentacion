import 'package:flutter/material.dart';

class SegundaApp extends StatelessWidget {
  const SegundaApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
  final persona =
        ModalRoute.of(context)!.settings.arguments as SeconsPageArguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos ingresados')),
      body: Center(
        child: Text(persona.name + persona.lastName + persona.profesionRol+ persona.documentoId+persona.tipoDocumet),
        ),
    );
  }
}
class SeconsPageArguments {
String name;
String lastName;
String profesionRol;
String documentoId ;
String tipoDocumet;

  
SeconsPageArguments({required this.name,required this.lastName, required this.profesionRol, required this.documentoId,required this.tipoDocumet});

  
}