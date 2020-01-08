import 'dart:async';

import 'package:flutter/material.dart';
import '../constants.dart';
import '../history.dart';

enum CleanedBtn { daily, monthly }

class MainBody extends StatefulWidget {
  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  CleanedBtn selectedBtn;
  String todayBtnText = 'Done Today!';
  String monthBtnText = 'Done This Month!';

  void btnTextChange(String text1, String text2) {
    if (selectedBtn == CleanedBtn.daily) {
      setState(() {
        todayBtnText = text1;
        Timer(Duration(seconds: 2), () {
          setState(() {
            todayBtnText = text2;
          });
        });
      });
    } else {
      setState(() {
        monthBtnText = text1;
        Timer(Duration(seconds: 2), () {
          setState(() {
            monthBtnText = text2;
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                        style: kBlackFont,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    RaisedButton(
                      color: Color(0xFFB2DFDB),
                      onPressed: () {
                        selectedBtn = CleanedBtn.daily;
                        btnTextChange('Registed to history!', 'Done Today!');
                      },
                      child: Text(
                        todayBtnText,
                        style: kGreenFont,
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
                        'At least once per month, Need to change to the new sand and disinfection the poobox',
                        textAlign: TextAlign.center,
                        style: kBlackFont,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    RaisedButton(
                      color: Color(0xFFB2DFDB),
                      onPressed: () {
                        selectedBtn = CleanedBtn.monthly;
                        btnTextChange(
                            'Registed to history!', 'Done This Month!');
                      },
                      child: Text(
                        monthBtnText,
                        style: kGreenFont,
                      ),
                    ),
                  ],
                ),
              ),
              // See history button
              Container(
                child: GestureDetector(
                  onTap: () {
                    // push to history page when text is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CleaningHistory()),
                    );
                  },
                  child: Text(
                    'See cleaning history',
                    textAlign: TextAlign.center,
                    style: kSeeHistoryFont,
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
