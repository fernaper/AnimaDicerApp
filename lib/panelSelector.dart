import 'package:flutter/material.dart';

class PanelSelector extends StatefulWidget {
  PanelSelector({Key key}) : super(key: key);

  @override
  _PanelSelectorStatus createState() => _PanelSelectorStatus();
}

class _PanelSelectorStatus extends State<PanelSelector> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Atributos',
      style: optionStyle,
    ),
    Text(
      'Index 1: Resistencias',
      style: optionStyle,
    ),
    Text(
      'Index 2: Secundarias',
      style: optionStyle,
    ),
    Text(
      'Index 3: Combate',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Atributos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Resistencias'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.control_point),
            title: Text('Secundarias'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code),
            title: Text('Combate'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.blueGrey,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
      ),
    );
  }
}