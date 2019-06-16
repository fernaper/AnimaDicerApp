import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {

  String _image = '';

  CircleImage(String image) :
      _image = image,
      super();

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
          backgroundImage: ExactAssetImage(_image),
          //minRadius: 90,
          //maxRadius: 150,
          radius: 30,
        );
  }
}