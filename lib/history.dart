import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './components/Header.dart';
import './components/CatFace.dart';

List dHistory = ['2020-1-8 15:00'];
List mHistory = List();

void dailyHistory() {
  var date = DateTime.now().toString();
  dHistory.add(date);
  print(dHistory.length);
}

void monthlyHistory() {
  var date = DateTime.now().toString();

  mHistory.add(date);
  print(mHistory);
}

Text dailyHistoryList() {
  if (dHistory.length > 0) {
    for (var i = 0; i < dHistory.length; i++) {
      return Text(dHistory[i]);
    }
  }
  return Text('history is empty');
}

Text monthlyHistoryList() {
  if (dHistory.length > 0) {
    for (var i = 0; i < dHistory.length; i++) {
      return Text(mHistory[i]);
    }
  }
  return Text('history is empty');
}

class CleaningHistory extends StatefulWidget {
  @override
  _CleaningHistoryState createState() => _CleaningHistoryState();
}

class _CleaningHistoryState extends State<CleaningHistory>
    with TickerProviderStateMixin {
  TabController _tabController;

  var dailyHistoryState = dHistory;
  var monthlyHistoryState = mHistory;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

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
            CatFace(imageName: 'cat-face3.png'),
            Expanded(
              flex: 6,
              child: Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.0),
                  decoration: BoxDecoration(
                    color: Color(0x99fff8e1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: TabBar(
                            unselectedLabelColor: Colors.grey,
                            labelColor: Color(0xFF00796B),
                            indicatorColor: Color(0xFFfff8e1),
                            labelStyle: TextStyle(
                              fontFamily: 'Poppins',
                            ),
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              color: Color(0xFFfff8e1),
                            ),
                            controller: _tabController,
                            tabs: <Widget>[
                              Tab(
                                text: 'Daily Cleaning',
                              ),
                              Tab(
                                text: 'Monthly Cleaning',
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: TabBarView(
                            controller: _tabController,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.0, vertical: 15.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(dailyHistoryState[0]),
                                        IconContent(
                                            icon: FontAwesomeIcons.trashAlt),
                                      ],
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFfff8e1),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(15.0),
                                child: Column(
                                  children: <Widget>[],
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFfff8e1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFfff8e1),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Remove all histories',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: Center(
                child: IconButton(
                  icon: Icon(FontAwesomeIcons.arrowLeft),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class IconContent extends StatelessWidget {
  IconContent({this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(icon);
  }
}
