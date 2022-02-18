import 'dart:convert';

import 'package:flutter/foundation.dart';

class Client_Model {
  String client;
  String clientprofile;
  String clientusername;
  String deadline;
  String fb;
  String insta;
  String skype;
  String zoom;
  List<int> meetinperior;
  String projectdetail;
  String projectkeyword;
  String selectcountry;
  String uid;
  Client_Model({
    this.client,
    this.clientprofile,
    this.clientusername,
    this.deadline,
    this.fb,
    this.insta,
    this.skype,
    this.zoom,
    this.meetinperior,
    this.projectdetail,
    this.projectkeyword,
    this.selectcountry,
    this.uid,
  });

  Client_Model copyWith({
    String client,
    String clientprofile,
    String clientusername,
    String deadline,
    String fb,
    String insta,
    String skype,
    String zoom,
    List<int> meetinperior,
    String projectdetail,
    String projectkeyword,
    String selectcountry,
    String uid,
  }) {
    return Client_Model(
      client: client ?? this.client,
      clientprofile: clientprofile ?? this.clientprofile,
      clientusername: clientusername ?? this.clientusername,
      deadline: deadline ?? this.deadline,
      fb: fb ?? this.fb,
      insta: insta ?? this.insta,
      skype: skype ?? this.skype,
      zoom: zoom ?? this.zoom,
      meetinperior: meetinperior ?? this.meetinperior,
      projectdetail: projectdetail ?? this.projectdetail,
      projectkeyword: projectkeyword ?? this.projectkeyword,
      selectcountry: selectcountry ?? this.selectcountry,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'client': client,
      'clientprofile': clientprofile,
      'clientusername': clientusername,
      'deadline': deadline,
      'fb': fb,
      'insta': insta,
      'skype': skype,
      'zoom': zoom,
      'meetinperior': meetinperior,
      'projectdetail': projectdetail,
      'projectkeyword': projectkeyword,
      'selectcountry': selectcountry,
      'uid': uid,
    };
  }

  factory Client_Model.fromMap(Map<String, dynamic> map) {
    return Client_Model(
      client: map['client'],
      clientprofile: map['clientprofile'],
      clientusername: map['clientusername'],
      deadline: map['deadline'],
      fb: map['fb'],
      insta: map['insta'],
      skype: map['skype'],
      zoom: map['zoom'],
      meetinperior: List<int>.from(map['meetinperior']),
      projectdetail: map['projectdetail'],
      projectkeyword: map['projectkeyword'],
      selectcountry: map['selectcountry'],
      uid: map['uid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Client_Model.fromJson(String source) =>
      Client_Model.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Client_Model(client: $client, clientprofile: $clientprofile, clientusername: $clientusername, deadline: $deadline, fb: $fb, insta: $insta, skype: $skype, zoom: $zoom, meetinperior: $meetinperior, projectdetail: $projectdetail, projectkeyword: $projectkeyword, selectcountry: $selectcountry, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Client_Model &&
        other.client == client &&
        other.clientprofile == clientprofile &&
        other.clientusername == clientusername &&
        other.deadline == deadline &&
        other.fb == fb &&
        other.insta == insta &&
        other.skype == skype &&
        other.zoom == zoom &&
        listEquals(other.meetinperior, meetinperior) &&
        other.projectdetail == projectdetail &&
        other.projectkeyword == projectkeyword &&
        other.selectcountry == selectcountry &&
        other.uid == uid;
  }

  @override
  int get hashCode {
    return client.hashCode ^
        clientprofile.hashCode ^
        clientusername.hashCode ^
        deadline.hashCode ^
        fb.hashCode ^
        insta.hashCode ^
        skype.hashCode ^
        zoom.hashCode ^
        meetinperior.hashCode ^
        projectdetail.hashCode ^
        projectkeyword.hashCode ^
        selectcountry.hashCode ^
        uid.hashCode;
  }
}
