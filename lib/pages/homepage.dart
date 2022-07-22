import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';


import 'package:pruebatecnica/pages/segundapages.dart';

class Homepage extends StatelessWidget {


  
  /* File? _image ;
  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

     // final imagepermanente = await saveFilePermanente(image.path);
      final imageTemporary = File(image.path);
      setState(() {
        this._image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('falla al cargar: $e ');
    }
  } */

 /*  Future<File> saveFilePermanente(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  } */

  late String nameValue;
  late String lastNameValue;
  late String profesionRol;
  late String documentoId;
  late String tipoDocument;
  final listaDocumentos = ["CC", "TI", "RC", "PASAPORTE"];
  String? documentoSelect = "CC";

  final formKey = GlobalKey<FormState>();


  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if(image == null) return;

      final imageTemp = File(image.path);

      setState(() {
        this.image = imageTemp;
      });
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if(image == null) return;

      final imageTemp = File(image.path);

     setState(() {
        this.image = imageTemp;
      });
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
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
                  decoration: const InputDecoration(labelText: "Nombres"),
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
               MaterialButton(
                  color: Color.fromARGB(255, 175, 198, 238),
                  child: const Text('Guardar'),
                  onPressed: () {
                    _showSeconPage(context);
                  },
                ),
                MaterialButton(
                  color: Color.fromARGB(255, 147, 6, 1),
                  child: const Text('Borrar'),
                  onPressed: () {
                    clear();
                  },
                ),
                
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

  Widget CustomButton({
    required String title,
    required IconData icon,
    required VoidCallback onClick,
  }) {
    return Container(
      width: 200,
      child: ElevatedButton(
          onPressed: onClick,
          child: Row(children: [
            Icon(icon),
            SizedBox(
              width: 20,
            ),
            Text(title)
          ])),
    );
  }

  void setState(Null Function() param0) {}
}
