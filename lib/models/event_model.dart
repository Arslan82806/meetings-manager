import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class EventModel {
  String uid;
  String clientName;
  String userName;
  String instagaram;
  String facebook;
  String skype;
  String zoom;
  String clientProfile;
  String meetingTime;
  String selectCountry;
  Timestamp deadline;
  String keyword;
  List<int> meetingPrior;
  EventModel({
    this.uid,
    this.clientName,
    this.userName,
    this.instagaram,
    this.facebook,
    this.skype,
    this.zoom,
    this.clientProfile,
    this.meetingTime,
    this.selectCountry,
    this.deadline,
    this.keyword,
    this.meetingPrior,
  });

  EventModel copyWith({
    Timestamp date,
    String uid,
    String clientName,
    String userName,
    String instagaram,
    String facebook,
    String skype,
    String zoom,
    String clientProfile,
    List<Timestamp> meetingTime,
    String selectCountry,
    Timestamp deadline,
    String keyword,
    List<int> meetingPrior,
  }) {
    return EventModel(
      uid: uid ?? this.uid,
      clientName: clientName ?? this.clientName,
      userName: userName ?? this.userName,
      instagaram: instagaram ?? this.instagaram,
      facebook: facebook ?? this.facebook,
      skype: skype ?? this.skype,
      zoom: zoom ?? this.zoom,
      clientProfile: clientProfile ?? this.clientProfile,
      meetingTime: meetingTime ?? this.meetingTime,
      selectCountry: selectCountry ?? this.selectCountry,
      deadline: deadline ?? this.deadline,
      keyword: keyword ?? this.keyword,
      meetingPrior: meetingPrior ?? this.meetingPrior,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'clientName': clientName,
      'userName': userName,
      'instagaram': instagaram,
      'facebook': facebook,
      'skype': skype,
      'zoom': zoom,
      'clientProfile': clientProfile,
      'meetingTime': meetingTime,
      'selectCountry': selectCountry,
      'deadline': deadline,
      'keyword': keyword,
      'meetingPrior': meetingPrior,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      uid: map['uid'],
      clientName: map['clientName'],
      userName: map['userName'],
      instagaram: map['instagaram'],
      facebook: map['facebook'],
      skype: map['skype'],
      zoom: map['zoom'],
      clientProfile: map['clientProfile'],
      meetingTime: map['meetingTime'],
      selectCountry: map['selectCountry'],
      deadline: map['deadline'],
      keyword: map['keyword'],
      meetingPrior: List<int>.from(map['meetingPrior'] ?? []),
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventModel( uid: $uid, clientName: $clientName, userName: $userName, instagaram: $instagaram, facebook: $facebook, skype: $skype, zoom: $zoom, clientProfile: $clientProfile, meetingTime: $meetingTime, selectCountry: $selectCountry, deadline: $deadline, keyword: $keyword, meetingPrior: $meetingPrior)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EventModel &&
        other.uid == uid &&
        other.clientName == clientName &&
        other.userName == userName &&
        other.instagaram == instagaram &&
        other.facebook == facebook &&
        other.skype == skype &&
        other.zoom == zoom &&
        other.clientProfile == clientProfile &&
        other.meetingTime == meetingTime &&
        other.selectCountry == selectCountry &&
        other.deadline == deadline &&
        other.keyword == keyword &&
        listEquals(other.meetingPrior, meetingPrior);
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        clientName.hashCode ^
        userName.hashCode ^
        instagaram.hashCode ^
        facebook.hashCode ^
        skype.hashCode ^
        zoom.hashCode ^
        clientProfile.hashCode ^
        meetingTime.hashCode ^
        selectCountry.hashCode ^
        deadline.hashCode ^
        keyword.hashCode ^
        meetingPrior.hashCode;
  }
}
