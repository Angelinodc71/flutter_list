import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Pantalla1 extends StatefulWidget {
  _Pantalla1State createState() => _Pantalla1State();
}

class _Pantalla1State extends State<Pantalla1> {
  var elementos = [];

  @override
  void initState() {
    super.initState();
    descargarClubs();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bienvenido',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bienvenido'),
        ),
        body: ListView.builder(
          itemCount: elementos.length,
          itemBuilder: (context, index) => Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Text(
                      elementos[index]["name"]
                  ),
                  Image.network("https://ringsdb.com/" + elementos[index]["imagesrc"])
                ],
              ),
            ),
        ),
      ),
    ),
    );
  }

  descargarClubs() async {
    var respuesta = await http.get("https://ringsdb.com/api/public/cards/");

    setState(() {
      elementos = jsonDecode(respuesta.body);
    });
  }
}
