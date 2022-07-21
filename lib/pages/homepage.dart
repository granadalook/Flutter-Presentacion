import 'package:flutter/material.dart';
import 'package:pruebatecnica/pages/segundapages.dart';

class Homepage extends StatelessWidget {
  late String nameValue;
  late String lastNameValue;
  late String profesionRol;
  late String documentoId;
  late String tipoDocument;
  final listaDocumentos = ["CC", "TI", "RC", "PASAPORTE"];
  String? documentoSelect = "CC";

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('PresentacionApp')),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: "Nombres"),
                  onSaved: (value) {
                    nameValue = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo Nombres Requerido";
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Apellidos"),
                  onSaved: (value) {
                    lastNameValue = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo Apellidos Requerido ";
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Profesion o Rol"),
                  onSaved: (value) {
                    profesionRol = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo Profesion Requerido ";
                    }
                  },
                ),
                DropdownButtonFormField(
                  value: documentoSelect,
                  icon: const Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.deepPurple,
                  ),
                  dropdownColor: Colors.deepPurple.shade50,
                  decoration: InputDecoration(
                      labelText: "Tipo de documento",
                      prefixIcon: Icon(Icons.document_scanner)),
                  items: listaDocumentos.map((valor) {
                    return DropdownMenuItem(
                      child: Text(valor),
                      value: valor,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      documentoSelect = value as String;
                    });
                  },
                  onSaved: (documentoSelect) {
                    tipoDocument = documentoSelect! as String;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Numero Documento"),
                  onSaved: (value) {
                    documentoId = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo Documento Requerido ";
                    }
                  },
                ),
                RaisedButton(
                  color: Color.fromARGB(255, 175, 198, 238),
                  child: const Text('Guardar'),
                  onPressed: () {
                    _showSeconPage(context);
                  },
                ),
                RaisedButton(
                  color: Color.fromARGB(255, 147, 6, 1),
                  child: const Text('Borrar'),
                  onPressed: () {
                    clear();
                  },
                )
              ],
            ),
          ),
        ));
  }

  void _showSeconPage(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Navigator.of(context).pushNamed("/segunda",
          arguments: SeconsPageArguments(
            name: this.nameValue,
            lastName: this.lastNameValue,
            profesionRol: this.profesionRol,
            documentoId: this.documentoId,
            tipoDocumet: this.tipoDocument,
          ));
    }
  }

  void clear() {
    formKey.currentState?.reset();
  }

  void setState(Null Function() param0) {}
}
