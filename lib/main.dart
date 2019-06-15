import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimaDicer',
      home: Scaffold(
        appBar: AppBar(
          title: Text('AnimaDicer - v0.0.0.1'),
          backgroundColor: Color.fromRGBO(150, 25, 15, 1.0),
        ),
        body: Center(
          child: Text('This is our first version'),
        ),
      ),
    );
  }
}