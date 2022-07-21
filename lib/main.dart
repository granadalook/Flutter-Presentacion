


import 'package:flutter/material.dart';
import 'package:pruebatecnica/pages/homepage.dart';
import 'package:pruebatecnica/pages/segundapages.dart';


void main(){
  runApp(  MyApp());
}

class  MyApp  extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'material App',
     // home:homepage(),
      initialRoute: "/",
      routes: {
        "/":(BuildContext context) =>  Homepage(),
        "/segunda":(BuildContext context) => const SegundaApp()

      },
    );
  }
}