
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
      appBar: AppBar(
        title: const Text("Datos Ingresados"),
      ),
      body: Center(
        child: Column(
          children: [
            
                 SizedBox(height: 20,),

            image != null ? ClipOval(child: Image.file(image!,width: 150,height: 150,),): ClipOval(child: Image.network('https://i.pinimg.com/474x/d7/52/45/d75245ef083eb6d380f4e37dd62994cb.jpg',width: 150,height: 150,)),
            Text('image'),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [
IconButton(
                color: Color.fromARGB(255, 18, 18, 19),icon: Icon(Icons.image),
                onPressed: () {
                  pickImage();
                },
                tooltip: 'Subir desde Galeria',
                iconSize: 40.0,
            ),
              IconButton(
                color: Color.fromARGB(255, 18, 18, 19),icon: Icon(Icons.add_a_photo),
                onPressed: () {
                  pickImageC();
                },
                 tooltip: 'Subir desde Camara',
                 iconSize: 40.0,
            ),
            ],),
            
          ],
        ),
      )
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