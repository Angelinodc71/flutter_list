import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_list/Pantalla2.dart';
import 'package:http/http.dart' as http;

class Pantalla1 extends StatefulWidget {
  _Pantalla1State createState() => _Pantalla1State();
}

class _Pantalla1State extends State<Pantalla1> {
  var cards = [];

  @override
  void initState() {
    super.initState();
    descargarCartas();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bienvenido',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bienvenido'),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: cards.length,
          itemBuilder: (context, index) => Container(
            child: RaisedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Pantalla2(cards[index])));
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Text(
                        cards[index]["name"]
                    ),
                    Image.network("https://ringsdb.com/" + cards[index]["imagesrc"])
                  ],
                ),
              ),
            ),
        ),
      ),
    ),
    );
  }

  descargarCartas() async {
    var respuesta = await http.get("https://ringsdb.com/api/public/cards/");

    setState(() {
      cards = jsonDecode(respuesta.body);
    });
  }
}
