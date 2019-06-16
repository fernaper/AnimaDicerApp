import 'package:flutter/material.dart';
import 'package:AnimaDicerApp/pages/modules/circleImage.dart';
import 'package:AnimaDicerApp/consts.dart';
import 'dart:math';

class Characters extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return CharactersState();
  }
}

enum CharacterClass {
  novel,
  assassin,
  summoner,
  explorer,
  warrior,
  acrobat_warrior,
  summoner_warrior,
  mentalist_warrior,
  sorcerer,
  mentalist_sorcerer,
  illusionist,
  thief,
  weapon_master,
  mentalist,
  paladin,
  dark_paladin,
  shadow,
  tao,
  technicist,
  warlock
}

enum BarType {
  life,
  zeon,
  ki,
}

class CharacterBar {
  int _maxBar = 100;
  int _currentBar = 100;
  String _text = '';
  Color _color = Colors.red;

  static CharacterBar LifeBar(int n) {
    return CharacterBar(BarType.life,n);
  }

  static CharacterBar ZeonBar(int n) {
    return CharacterBar(BarType.zeon,n);
  }

  static CharacterBar KiBar(int n) {
    return CharacterBar(BarType.ki,n);
  }

  CharacterBar (BarType type, int n) {
    if (BarType.life == type) {
      _text = 'Vida: ';
      _color = Colors.red;
      _text = _text.padRight(20 - _text.length);
    } else if (BarType.zeon == type) {
      _text = 'Zeon: ';
      _color = Colors.blue;
      _text = _text.padRight(20 - _text.length - 1);
    } else if (BarType.ki == type) {
      _text = 'Ki: ';
      _color = Colors.amber;
      _text = _text.padRight(20 - _text.length);
    }
    _maxBar = n;
    _currentBar = n;
  }

  double getPercentage() {
    return _currentBar / _maxBar;
  }

  void substractValueBar(int n) {
    _currentBar -= n;
  }

  void addValueBar(int n) {
    if (_currentBar + n <= _maxBar)
      _currentBar += n;
    else
      _currentBar = _maxBar;
  }

  Widget displayBar() {
    return Row(
      children: <Widget>[
        Text(
          _text,
          style: TextStyle(
            fontFamily: 'RobotoMono'
          ),
        ),
        Flexible(
          child: LinearProgressIndicator(
            value: getPercentage(),
            valueColor: AlwaysStoppedAnimation<Color>(_color),
            backgroundColor: Color.fromRGBO(210, 210, 210, 1.0),
          ),
        ),
      ],
    );
  }
}

class CharacterSheet {
  String _pathImage = '';
  String _name = '';
  int _lvl = 0;
  CharacterClass _chClass = CharacterClass.novel;
  CharacterBar _life = CharacterBar.LifeBar(200);
  CharacterBar _ki = CharacterBar.KiBar(20);
  CharacterBar _zeon = CharacterBar.ZeonBar(1000);

  CharacterSheet(pathImage, name, lvl, chClass, life, ki, zeon) {
    _pathImage = pathImage;
    _name = name;
    _lvl = lvl;
    _chClass = chClass;
    _life = life;
    _ki = ki;
    _zeon = zeon;
  }

  static CharacterSheet example() {
    Random rn = Random();

    CharacterSheet ch = CharacterSheet(
        'assets/images/token.png',
        'Default Token',
        rn.nextInt(11),
        CharacterClass.values[rn.nextInt(CharacterClass.values.length)],
        CharacterBar.LifeBar(100),
        CharacterBar.KiBar(100),
        CharacterBar.ZeonBar(100),
    );

    ch.getLifeBar().substractValueBar(20);
    ch.getZeonBar().substractValueBar(30);
    ch.getKiBar().substractValueBar(40);
    return ch;
  }

  String getName() => this._name;
  int getLvl() => this._lvl;
  String getPathImage() => this._pathImage;
  CharacterClass getClass() => this._chClass;
  CharacterBar getLifeBar() => this._life;
  CharacterBar getKiBar() => this._ki;
  CharacterBar getZeonBar() => this._zeon;
}

class CharactersState extends State<Characters> {

  List<CharacterSheet> _characterSheets = [CharacterSheet.example()];

  void addItem() {
    _characterSheets.add(CharacterSheet.example());
  }

  @override
  Widget build(BuildContext context) {
    //return _myListView();
    return Scaffold(
        body:Stack(
          children: <Widget>[
            Column(children: [
              Container(
                margin: EdgeInsets.all(10.0),
                child: Text(
                  'Personajes',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Expanded(
                child: _myListView(),
              ),
            ]),
            Container(
              padding: EdgeInsetsDirectional.zero,
              margin: EdgeInsets.all(10.0),
              child: FloatingActionButton(
                backgroundColor: Colors.green.withOpacity(0.7),
                mini: true,
                onPressed: () {
                  setState(() {
                    _characterSheets.add(CharacterSheet.example());
                  });
                },
                child: Icon(
                  Icons.add_circle_outline,
                  color: Colors.white.withOpacity(0.9),
                  size: 30,
                ),
              ),
              alignment: Alignment.bottomRight,
            ),
          ],
          overflow: Overflow.visible,
          fit: StackFit.expand,
        ),
    );
  }

  Widget _myListView() {
    return ListView.builder(
      itemCount: _characterSheets.length,
      itemBuilder: (context, index) {
        final item = _characterSheets[index];
        return Card(
          child: ListTile(
            leading: CircleImage(item.getPathImage()),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  item.getName(),textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'Lvl: '+item.getLvl().toString(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                )
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Text('Lvl: '+item.getLvl().toString()),
                item.getLifeBar().displayBar(),
                item.getZeonBar().displayBar(),
                item.getKiBar().displayBar()
              ],
            ),
            trailing: Text(characterClassTraductor[item.getClass().index]),
            onTap: () { //                                  <-- onTap
              setState(() {
                print('Click in ' + index.toString());
              });
            },
            onLongPress: () { //                            <-- onLongPress
              setState(() {
                //_characterSheets.removeAt(index);
                print('Long click in ' + index.toString());
              });
            },
          ),
        );
      },
    );
  }
}