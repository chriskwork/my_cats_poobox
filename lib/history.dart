import 'package:flutter/material.dart';

import './components/Header.dart';
import './components/CatFace.dart';
import './components/TwitterLink.dart';

class CleaningHistory extends StatefulWidget {
  @override
  _CleaningHistoryState createState() => _CleaningHistoryState();
}

class _CleaningHistoryState extends State<CleaningHistory>
    with TickerProviderStateMixin {
  TabController _tabController;

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
                            controller: _tabController,
                            tabs: <Widget>[
                              Tab(
                                text: '11',
                              ),
                              Tab(
                                text: '22',
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
                                child: Text('hello1'),
                              ),
                              Container(
                                child: Text('hello2'),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Text('Remove all histories'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            TwitterLink(),
          ],
        ),
      ),
    ));
  }
}
