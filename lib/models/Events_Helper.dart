import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meetings_manager/models/event_model.dart';

// import 'package:flutter/material.dart';

class Meetings {
  Timestamp date;
  final meetingskey = 'meetings';
  StreamSubscription _subscription;
  StreamController<List<EventModel>> _streamController;
  Sink<List<EventModel>> _sink;
  Stream<List<EventModel>> _meetingsStream;
  Stream<List<EventModel>> get meetingStream => _meetingsStream;
  Meetings();
  Meetings.withStreamInitialized(String uid) {
    _streamController = StreamController<List<EventModel>>();
    _sink = _streamController.sink;
    _meetingsStream = _streamController.stream;
    _readData(uid);
  }
  _readData(String uid) async {
    Stream<QuerySnapshot> querySnapShot;
    querySnapShot = FirebaseFirestore.instance
        .collection(meetingskey)
        .where(uid)
        .snapshots();
    _subscription = querySnapShot.listen((event) {
      List<EventModel> meetings = [];
      for (var item in event.docs) {
        EventModel meeting = EventModel.fromMap(item.data());
        meetings.add(meeting);
      }
      _sink.add(meetings);
    });
  }

  void dispose() {
    _subscription.cancel();
    _streamController.close();
  }
}

class StaticInfo {
  static EventModel user;
  static bool newmessages = false;
  static bool onallchatpage;
  static bool newNotification = false;
}
