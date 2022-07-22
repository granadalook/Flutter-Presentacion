

import 'package:flutter/material.dart';

import 'package:super_bottom_navigation_bar/super_bottom_navigation_bar.dart';


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
                  decoration: const InputDecoration(labelText: "Nombre",prefixIcon: Icon(Icons.text_fields)),
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
                  decoration: InputDecoration(labelText: "Apellido",prefixIcon: Icon(Icons.text_rotation_none)),
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
                  decoration: InputDecoration(labelText: "Profesion o Rol",prefixIcon: Icon(Icons.work)),
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
                  decoration: const InputDecoration(
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
                  decoration: InputDecoration(labelText: "Numero Documento",prefixIcon: Icon(Icons.numbers)),
                  
                  onSaved: (value) {
                    documentoId = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty ) {
                      return "Campo Documento Requerido  ";
                    }if( value.length > 8|| value.length < 2){
                      return "Maximo 8 y minimo 2 caracteres entre numeros y letras";
                    }
                  },
                ),
               Row(mainAxisAlignment: MainAxisAlignment.center ,children: [
                IconButton(
                    color: Color.fromARGB(255, 216, 1, 1),
                    icon: Icon(Icons.clear_all_rounded),
                    onPressed: () {
                      clear();
                    },
                    tooltip: 'Limpiar Campos',
                    iconSize: 40.0,
                  ),  IconButton(
                    color: Color.fromARGB(255, 3, 99, 19),
                    icon: Icon(Icons.save_alt_outlined),
                    onPressed: () {
                      _showSeconPage(context);;
                    },
                    tooltip: 'Guardar datos',
                    iconSize: 40.0,
                  )
               ],)
              ],
            ),
          ),
          
        ),        bottomNavigationBar: SuperBottomNavigationBar(
                currentIndex: 2,
                items: makeNavItems(),
                onSelected: (index){
                  print('tab $index');
                },
              ),
         
        );
  }
    List<SuperBottomNavigationBarItem> makeNavItems() {
         return [
               const SuperBottomNavigationBarItem(
                 unSelectedIcon: Icons.home_outlined,
                 selectedIcon: Icons.home_outlined,
                 size: 30,
                 backgroundShadowColor: Colors.red,
                 borderBottomColor: Colors.red,
                 borderBottomWidth: 3,
                 splashColor: Colors.red,
                 selectedIconColor: Colors.red,
                 unSelectedIconColor: Colors.red
               ),
               const SuperBottomNavigationBarItem(
                   unSelectedIcon: Icons.search_outlined,
                   selectedIcon: Icons.search_outlined,
                   size: 30,
                   backgroundShadowColor: Colors.blue,
                   borderBottomColor: Colors.blue,
                   borderBottomWidth: 3,
                   splashColor: Colors.blue,
                   selectedIconColor: Colors.blue,
                   unSelectedIconColor: Colors.blue
               ),
               const SuperBottomNavigationBarItem(
                   unSelectedIcon: Icons.star_border_outlined,
                   selectedIcon: Icons.star_border_outlined,
                   size: 30,
                   backgroundShadowColor: Colors.yellowAccent,
                   borderBottomColor: Colors.yellowAccent,
                   borderBottomWidth: 3,
                   splashColor: Colors.yellowAccent,
                   selectedIconColor: Colors.yellowAccent,
                   unSelectedIconColor: Colors.yellowAccent
               ),
               const SuperBottomNavigationBarItem(
                   unSelectedIcon: Icons.done_outline_rounded,
                   selectedIcon: Icons.done_outline_rounded,
                   size: 30,
                   backgroundShadowColor: Colors.green,
                   borderBottomColor: Colors.green,
                   borderBottomWidth: 3,
                   splashColor: Colors.green,
                   selectedIconColor: Colors.green,
                   unSelectedIconColor: Colors.green
               ),
               const SuperBottomNavigationBarItem(
                   unSelectedIcon: Icons.person_outline,
                   selectedIcon: Icons.person_outline,
                   size: 30,
                   backgroundShadowColor: Colors.purpleAccent,
                   borderBottomColor: Colors.purpleAccent,
                   borderBottomWidth: 3,
                   splashColor: Colors.purpleAccent,
                   selectedIconColor: Colors.purpleAccent,
                   unSelectedIconColor: Colors.purpleAccent
               ),
             ];
      }
//
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
