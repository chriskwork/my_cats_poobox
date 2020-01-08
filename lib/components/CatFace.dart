import 'package:flutter/material.dart';

class CatFace extends StatelessWidget {
  CatFace({@required this.imageName});

  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Image.asset('images/$imageName'),
        ),
      ),
    );
  }
}
