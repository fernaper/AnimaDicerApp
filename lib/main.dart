import 'package:flutter/material.dart';
import './pages/characterPage.dart';
import 'package:AnimaDicerApp/consts.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
          appBar: AppBar(title: Text(title)),
          body: Characters(),
      )
    );
  }
}