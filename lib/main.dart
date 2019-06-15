import 'package:flutter/material.dart';
import 'panelSelector.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  static const String _title = 'AnimaDicer';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: PanelSelector(),
    );
  }
}