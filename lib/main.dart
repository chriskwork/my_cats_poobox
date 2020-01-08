import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// components
import './components/Header.dart';
import './components/CatFace.dart';
import './components/MainBody.dart';
import './components/TwitterLink.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Cat\'s Poobox',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.teal.shade400, Colors.teal.shade900],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // components
              Header(),
              CatFace(imageName: 'cat-face1.png'),
              MainBody(),
              CatFace(imageName: 'cat-face2.png'),
              TwitterLink(),
            ],
          ),
        ),
      ),
    );
  }
}
