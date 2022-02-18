import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel, EventList;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:get/get.dart';
import 'package:meetings_manager/Screens/AddMeeting.dart';
import 'package:meetings_manager/Screens/MeetingUpdate.dart';

import 'package:meetings_manager/models/color.dart';
import 'package:meetings_manager/models/event_model.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  // String _date;
  // Meetings helper;
  DateTime date;
  DateTime selectedate = DateTime.now();
  // Meetings _meeting;
  var subscription;

  List<EventModel> meetingonselectedonDate = [];

  // ignore: public_member_api_docs

  @override
  void initState() {
    super.initState();
    getList();
    _getMeetingsOnSelectedDate();
  }

  bool isLoading = false;

  Future<void> getList() async {
    setState(() {
      isLoading = true;
    });
    try {
      await FirebaseFirestore.instance
          .collection('ClientAddData')
          .get()
          .then((QuerySnapshot snapshot) => snapshot.docs.forEach((e) {
                allEvents.add(EventModel.fromMap(e.data()));
                userId = "${e.data()['uid']}";
                print(e.toString());
              }));
      print('THIS IS THE LENTHT OF THE ARRAY ${allEvents.length}');

      for (int i = 0; i < allEvents.length; i++) {
        DateTime dateTime = DateTime(
          allEvents[i].deadline.toDate().year,
          allEvents[i].deadline.toDate().month,
          allEvents[i].deadline.toDate().day,
        );
        print(dateTime);

        _markedDateMap.add(
          dateTime,
          Event(
            title: allEvents[i].userName,
            dot: Container(
              margin: EdgeInsets.symmetric(horizontal: 1.0),
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
              height: 6.0,
              width: 6.0,
            ),
            date: dateTime,
          ),
        );
      }
      setState(() {});
    } catch (e) {
      print('thIS IS THE ERRO ${e.toString()}');
    }

    setState(() {
      isLoading = false;
    });
  }

  String userId;
  final firestore = FirebaseFirestore.instance;
  List<EventModel> allEvents = [];

  DateTime _currentDate = DateTime(2021, 6, 28);

  DateTime _currentDate2 = DateTime(2021, 6, 28);

  DateTime _targetDateTime = DateTime(2021, 6, 28);

  EventList<Event> _markedDateMap = new EventList<Event>(events: {});
  List<EventModel> getEvents() {
    if (selectedate == null) {
      return allEvents;
    } else {
      return allEvents
          .where((element) =>
              element.deadline.toDate().year == selectedate.year &&
              element.deadline.toDate().month == selectedate.month &&
              element.deadline.toDate().day == selectedate.day)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    print('LENGHT OF THE DATE MARKED MAP ${_markedDateMap.events?.toString()}');

    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(child: Text("MEETINGS")),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 60.0),
                            child: Container(
                                height: 300,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: calender()),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: getEvents().length,
                            itemBuilder: (context, index) {
                              EventModel eventModel1 = getEvents()[index];
                              print(
                                  '++++++++++++++++${eventModel1.uid}+++++++++++++++++=');
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 28, right: 28, top: 7),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: col)),
                                    height: MediaQuery.of(context).size.height *
                                        0.122,
                                    // width: MediaQuery.of(context).size.width * .85,
                                    child: Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                              text:
                                                  TextSpan(children: <TextSpan>[
                                            TextSpan(
                                                text:
                                                    '${eventModel1.clientName}',
                                                style: TextStyle(
                                                    color: Colors.black)),
                                            TextSpan(
                                                text: '',
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                          ])),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          RichText(
                                              text:
                                                  TextSpan(children: <TextSpan>[
                                            TextSpan(
                                                text: 'Meeting Time :',
                                                style: TextStyle(
                                                    color: Colors.black)),
                                            TextSpan(
                                                text:
                                                    ' ${eventModel1.meetingTime}',
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                          ])),
                                          SizedBox(
                                            height: 0,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            // crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              RichText(
                                                  text: TextSpan(children: <
                                                      TextSpan>[
                                                TextSpan(
                                                    text: 'Project Keyword :',
                                                    style: TextStyle(
                                                        color: Colors.black)),
                                                TextSpan(
                                                    text:
                                                        ' ${eventModel1.keyword}',
                                                    style: TextStyle(
                                                        color: Colors.grey)),
                                              ])),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  MeetingUpdate(
                                                                    user:
                                                                        eventModel1
                                                                            .uid,
                                                                  )));
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors
                                                                .grey[300]),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(180),
                                                      ),
                                                      child: CircleAvatar(
                                                        radius: 15,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        child: Icon(
                                                            Icons.navigate_next,
                                                            color: Colors.blue),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 60,
                          width: 60,
                          child: FloatingActionButton(
                            onPressed: () {
                              Get.to(Addmeeting());
                            },
                            child: Icon(
                              Icons.add,
                              size: 60,
                            ),
                            foregroundColor: Colors.blue,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
  }

  Widget calender() {
    return CalendarCarousel<Event>(
      markedDatesMap: _markedDateMap,
      todayBorderColor: Colors.green,
      onDayPressed: (date, events) {
        this.setState(() => _currentDate2 = date);
        events.forEach((event) => print(event.title));
        selectedate = date;
        print(date);
      },
      daysHaveCircularBorder: null,
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
      height: 420.0,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      // customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder:
          CircleBorder(side: BorderSide(color: Colors.yellow)),
      markedDateCustomTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.blue,
      ),
      // showHeader: true,
      todayTextStyle: TextStyle(
        color: Colors.blue,
      ),
      todayButtonColor: Colors.yellow,
      selectedDayTextStyle: TextStyle(
        color: Colors.yellow,
      ),
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      prevDaysTextStyle: TextStyle(
        fontSize: 14,
        color: Colors.grey,
      ),
      inactiveDaysTextStyle: TextStyle(
        color: Colors.tealAccent,
        fontSize: 16,
      ),
      // onCalendarChanged: (DateTime date) {
      //   this.setState(() {
      //     _targetDateTime = date;
      //     _currentMonth = DateFormat.yMMM().format(_targetDateTime);
      //   });
      // },
      // onDayLongPressed: (DateTime date) {
      //   print('long pressed date $date');
      // },
    );
  }

  // EventList<Event> _markedDateMap1 = EventList<Event>(
  //   events: {
  //     DateTime(2021, 05, 27): [
  //       Event(
  //         date: DateTime(2021, 05, 27),

  //         title: 'Poya Day',
  //         // icon: _poyaeventIcon(DateTime(2020, 12, 29).day.toString()),
  //         dot: Container(
  //           margin: EdgeInsets.symmetric(horizontal: 1.0),
  //           color: Colors.red,
  //           height: 5.0,
  //           width: 5.0,
  //         ),
  //       ),
  //     ],
  //     DateTime(2021, 01, 14): [
  //       Event(
  //         date: DateTime(2021, 01, 14),
  //         title: 'Tamil Thai Pongal Day',
  //         //icon: _otheralleventIcon(DateTime(2021, 01, 14).day.toString()),
  //         dot: Container(
  //           margin: EdgeInsets.symmetric(horizontal: 1.0),
  //           color: Colors.red,
  //           height: 5.0,
  //           width: 5.0,
  //         ),
  //       ),
  //     ],
  //   },
  // );

  _getMeetingsOnSelectedDate() {
    meetingonselectedonDate = allEvents.where((element) {
      var date = element.deadline;
      return date.toDate().year == selectedate.year &&
          date.toDate().month == selectedate.month &&
          date.toDate().day == selectedate.day;
    }).toList();
  }
}
