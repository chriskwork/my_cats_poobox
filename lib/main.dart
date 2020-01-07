import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

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
              Expanded(
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'My Cat\'s ',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Poppins',
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Poobox',
                          style: TextStyle(
                            color: Color(0xFFFFC107),
                            fontSize: 30.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Image.asset('images/cat-face1.png'),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 35.0),
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    decoration: BoxDecoration(
                      color: Colors.teal.shade300,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        // main contents : text, button
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Text(
                                  'The poobox of your adorable cat needs to be cleaned at least 1 - 2 times per day',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF212121)),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              RaisedButton(
                                color: Color(0xFFB2DFDB),
                                onPressed: () {
                                  print('btn clicked');
                                },
                                child: Text(
                                  'Done Today!',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.teal.shade700),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // main contents : text, button
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Text(
                                  'The poobox of your adorable cat needs to be cleaned at least 1 - 2 times per day',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF212121)),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              RaisedButton(
                                color: Color(0xFFB2DFDB),
                                onPressed: () {
                                  print('btn clicked');
                                },
                                child: Text(
                                  'Done This Month!',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.teal.shade700),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // See history button
                        Container(
                          child: Text(
                            'See cleaning history',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.teal.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // At least once per month, it\'s necessary to change to the new sand and disinfection the poobox
              Expanded(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Image.asset('images/cat-face2.png'),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: () async {
                      const url = 'https://twitter.com/yohan_k_dev';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Text(
                      '@yohan_k_dev',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
