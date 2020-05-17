import 'package:flutter/material.dart';
import 'package:plakayorum_mobile/views/plakaAra.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Plaka Yorum"),
          backgroundColor: Colors.blueGrey,
          elevation: 0.0,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blueGrey, Colors.deepPurple]),
          ),
          child: PlakaAra(),
        ),
      ),
    );
  }
}
