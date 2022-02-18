// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:meetings_manager/Screens/Clients.dart';
import 'package:meetings_manager/Screens/home_screen.dart';
import 'package:meetings_manager/Screens/settings.dart';
import 'package:meetings_manager/models/color.dart';

import 'AddMeeting.dart';
import 'package:meetings_manager/Screens/BottomAppBar.dart';

class Home extends StatefulWidget {
  // final calendarController _controller = calendarController();
  var _controller;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  // final List<Widget> _children =[Home(), Addmeeting(), ];
  DateTime _currentDate = DateTime(2021, 4, 8);
  DateTime _currentDate2 = DateTime(2021, 4, 8);
  String _currentMonth = DateFormat.yMMM().format(DateTime(2021, 4, 8));
  DateTime _targetDateTime = DateTime(2021, 4, 8);
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

//  List<DateTime> _markedDate = [DateTime(2018, 9, 20), DateTime(2018, 10, 11)];
  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: new Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2021, 10, 8): [
        new Event(
          date: new DateTime(2021, 10, 8),
          title: 'Event 1',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.red,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2021, 4, 8),
          title: 'Event 2',
          icon: _eventIcon,
        ),
        new Event(
          date: new DateTime(2021, 4, 8),
          title: 'Event 3',
          icon: _eventIcon,
        ),
      ],
    },
  );

  @override
  void initState() {
    /// Add more events to _markedDateMap EventList
    // _markedDateMap.add(
    //     new DateTime(2021, 4, 8),
    //     new Event(
    //       date: new DateTime(2021, 4, 8),
    //       title: 'Event 5',
    //       icon: _eventIcon,
    //     ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // bottomNavigationBar: bottomAppBar(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.home,
                size: 35,
              ),
              title: new Text(''),
            ),
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.people_alt_sharp,
                size: 35,
              ),
              title: new Text(''),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 35,
                ),
                title: Text(''))
          ],
        ),
        backgroundColor: Colors.grey[200],
        body: _currentIndex == 0
            ? HomeTab()
            : _currentIndex == 1
                ? Clients()
                : Settings()

        // :_currentIndex==1?Addmeeting():Settings());
        );
  }
}
