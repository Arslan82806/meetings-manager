import 'package:meetings_manager/Screens/meetingfacebookupdate.dart';
import 'package:meetings_manager/Screens/meetinginstaupdate.dart';
import 'package:meetings_manager/Screens/meetingskypeupdate..dart';
import 'package:meetings_manager/Screens/zoomupdate.dart';

import 'package:dropdownfield/dropdownfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetings_manager/Screens/CustomReminder.dart';

import 'package:meetings_manager/models/color.dart';

class MeetingUpdate extends StatefulWidget {
  final String user;
  const MeetingUpdate({Key key, this.user}) : super(key: key);
  @override
  _MeetingUpdateState createState() => _MeetingUpdateState();
}

class _MeetingUpdateState extends State<MeetingUpdate> {
  @override
  void initState() {
    super.initState();
    getdata();
  }

  List<int> meetings = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool checkboxValue = false;
  bool checkboxValue2 = false;
  bool checkboxValue3 = false;
  bool checkboxValue4 = false;
  bool enabledinsta = false;
  bool enabledfacebook = false;
  bool enabledskype = false;
  bool enabledzoom = false;
  bool meeting;
  String choosevalue;
  String name1;
  final TextEditingController nameoptional = TextEditingController();
  final TextEditingController country = TextEditingController();
  final TextEditingController clientprofile = TextEditingController();
  final TextEditingController meetingTime = TextEditingController();
  final TextEditingController deadline = TextEditingController();
  final TextEditingController keyword = TextEditingController();
  final TextEditingController meetingPrior = TextEditingController();
  String selectCity = "";
  String selectName = "";
  String username1;
  String projectdetail1;
  String meetingtime1;
  String country1;
  Timestamp deadline1;
  String keyword1;
  String userId;
  TextEditingController name = new TextEditingController();
  TextEditingController username = new TextEditingController();
  String insta = '';
  String fb = '';
  String skype = '';
  String zoom = '';
  TextEditingController selectCountry = new TextEditingController();
  List<String> clientname = ["Haseeb", "Hassan", "Hamza", "Usman"];
  List<String> cities = [
    "Lahore",
    "islamabad",
    "Karachi",
    "Quetta",
    "Peshawer"
  ];
  final meetingPeriorList = const [
    {'id': 1, 'Hours': '1Hour'},
    {'id': 2, 'Hours': '2 Hour'},
    {'id': 3, 'Hours': '3 Hour'},
  ];
  String dropdownvalue = 'First';
  final adddata = FirebaseFirestore.instance.collection('ClientAddData');
  getdata() async {
    setState(() {
      meeting = true;
    });

    await adddata.doc(widget.user).get().then((documentSnapshot) {
      name1 = documentSnapshot.data()['clientName'];

      username1 = documentSnapshot.data()['userName'];
      insta = documentSnapshot.data()['instagaram'];
      fb = documentSnapshot.data()['facebook'];
      skype = documentSnapshot.data()['skype'];
      zoom = documentSnapshot.data()['zoom'];
      projectdetail1 = documentSnapshot.data()['clientProfile'];
      meetingtime1 = documentSnapshot.data()['meetingTime'];
      country1 = documentSnapshot.data()['selectCountry'];
      deadline1 = documentSnapshot.data()['deadline'];
      keyword1 = documentSnapshot.data()['keyword'];
      meetings = List.from(documentSnapshot.data()['meetingPrior']);
      userId = documentSnapshot.data()['uid'];
    });
    print(name1);
    setState(() {
      meeting = false;
    });
  }

  // Future<void> add() {
  //   // var firebaseUser =  FirebaseAuth.instance.currentUser;
  //   if (_formkey.currentState.validate()) {
  //     adddata.doc(uid).set({
  //       "ClientName": name.text,
  //       "ClientUserName": username.text,
  //       "Instagram": insta,
  //       "FaceBook": fb,
  //       "Skype": skype,
  //       "Zoom": zoom,
  //       "ClientProfile": clientprofile.text,
  //       "MeetingTime": meetingTime.text,
  //       "SelectCountry": selectCountry.text,
  //       "DeadLine": deadline.text,
  //       "Keyword": keyword.text,
  //       "MeetingPrior": selectedPrior,
  //       "uid": uid.toString(),
  //       // "Instagaram": instagram;
  //     });
  //     print('id= $uid');
  //   }
  // }

  List<num> selectedPrior = [
    // 1 : true,
    // 2 : false,
    // 3 : false
  ];

  Widget build(BuildContext context) {
    print('+++++++++++++++++++++${widget.user}+++++++++++++++++++++');
    print('++++++++++++++++++++$meetings++++++++++++++++++++++++');
    print("$name1");
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Center(
              child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  'images/back.png',
                  scale: 10,
                ),
              ),
              SizedBox(
                width: 90,
              ),
              Text('Meeting'),
            ],
          )),
          backwardsCompatibility: false,
          automaticallyImplyLeading: false,
        ),
        body: meeting == true
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            // color: Colors.grey[200],
                            height: MediaQuery.of(context).size.height * 0.38,
                            width: 300,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: col, width: 1.5)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10.0, top: 10),
                              child: Form(
                                key: _formkey,
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      // onSaved: (input){
                                      //   input = name.trim();
                                      // },
                                      controller: name,
                                      // validator: (input){
                                      //   if(input.isEmpty) return "Please Enter Email";
                                      // },
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue,
                                                  width: 1.5)),
                                          hintText: '$name1'),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      // onSaved: (input){
                                      //   input = name.trim();
                                      // },
                                      controller: username,
                                      validator: (input) {
                                        if (input.isEmpty)
                                          return "Please Enter Email";
                                      },
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue,
                                                  width: 1.5)),
                                          hintText: '$username1'),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.blue, width: 1.5)),
                                      height: 130,
                                      width: 280,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text('Contact Info'),
                                            ),
                                            SizedBox(
                                              height: 0,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () async {
                                                      final String result =
                                                          await Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          Meetinginsta(
                                                                            user:
                                                                                userId,
                                                                          )));
                                                      insta = result;
                                                      print(insta);
                                                      setState(() {
                                                        // enabledinsta = true;
                                                        if (insta.isNotEmpty) {
                                                          enabledinsta = true;
                                                        } else {
                                                          enabledinsta = false;
                                                        }
                                                      });
                                                    },
                                                    child: Container(
                                                      child: Stack(children: [
                                                        Opacity(
                                                          opacity:
                                                              insta.isNotEmpty
                                                                  ? 1
                                                                  : 0.6,
                                                          child: Image.asset(
                                                            'images/instagaram.png',
                                                            height: 60,
                                                            width: 60,
                                                          ),
                                                        ),
                                                        Positioned(
                                                          top: 0,
                                                          right: 0,
                                                          child:
                                                              insta.isNotEmpty
                                                                  ? Icon(
                                                                      Icons
                                                                          .check_circle,
                                                                      size: 15,
                                                                      color: Colors
                                                                          .green,
                                                                    )
                                                                  : Container(),
                                                        )
                                                      ]),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () async {
                                                      final String result =
                                                          await Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      MeetingFacebook(
                                                                          user:
                                                                              userId)));
                                                      fb = result;
                                                      print(insta);
                                                      setState(() {
                                                        // enabledinsta = true;
                                                        if (fb.isNotEmpty) {
                                                          enabledfacebook =
                                                              true;
                                                        } else {
                                                          enabledfacebook =
                                                              false;
                                                        }
                                                      });
                                                    },
                                                    child: Container(
                                                      child: Stack(children: [
                                                        Opacity(
                                                          opacity: fb.isNotEmpty
                                                              ? 1
                                                              : 0.6,
                                                          child: Image.asset(
                                                            'images/Facebook.png',
                                                            height: 60,
                                                            width: 60,
                                                          ),
                                                        ),
                                                        Positioned(
                                                          top: 0,
                                                          right: 0,
                                                          child: fb.isNotEmpty
                                                              ? Icon(
                                                                  Icons
                                                                      .check_circle,
                                                                  size: 15,
                                                                  color: Colors
                                                                      .green,
                                                                )
                                                              : Container(),
                                                        )
                                                      ]),
                                                    ),
                                                  ),
                                                  //
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  //
                                                  GestureDetector(
                                                    onTap: () async {
                                                      final String result =
                                                          await Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      Skypemeeting(
                                                                          user:
                                                                              userId)));
                                                      skype = result;
                                                      print(insta);
                                                      setState(() {
                                                        // enabledinsta = true;
                                                        if (skype.isNotEmpty) {
                                                          enabledskype = true;
                                                        } else {
                                                          enabledskype = false;
                                                        }
                                                      });
                                                    },
                                                    child: Container(
                                                      child: Stack(children: [
                                                        Opacity(
                                                          opacity:
                                                              skype.isNotEmpty
                                                                  ? 1
                                                                  : 0.6,
                                                          child: Image.asset(
                                                            'images/Skype.png',
                                                            height: 60,
                                                            width: 60,
                                                          ),
                                                        ),
                                                        Positioned(
                                                          top: 0,
                                                          right: 0,
                                                          child:
                                                              skype.isNotEmpty
                                                                  ? Icon(
                                                                      Icons
                                                                          .check_circle,
                                                                      size: 15,
                                                                      color: Colors
                                                                          .green,
                                                                    )
                                                                  : Container(),
                                                        )
                                                      ]),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  //
                                                  GestureDetector(
                                                    onTap: () async {
                                                      final String result =
                                                          await Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      Zoomupdate(
                                                                          user:
                                                                              userId)));
                                                      zoom = result;
                                                      print(insta);
                                                      setState(() {
                                                        // enabledinsta = true;
                                                        if (zoom.isNotEmpty) {
                                                          enabledzoom = true;
                                                        } else {
                                                          enabledzoom = false;
                                                        }
                                                      });
                                                    },
                                                    child: Container(
                                                      child: Stack(children: [
                                                        Opacity(
                                                          opacity:
                                                              zoom.isNotEmpty
                                                                  ? 1
                                                                  : 0.6,
                                                          child: Image.asset(
                                                            'images/Zoom.png',
                                                            height: 60,
                                                            width: 60,
                                                          ),
                                                        ),
                                                        Positioned(
                                                          top: 0,
                                                          right: 0,
                                                          child: zoom.isNotEmpty
                                                              ? Icon(
                                                                  Icons
                                                                      .check_circle,
                                                                  size: 15,
                                                                  color: Colors
                                                                      .green,
                                                                )
                                                              : Container(),
                                                        )
                                                      ]),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        // height: MediaQuery.of(context).size.height * 0.64,
                        // width: MediaQuery.of(context).size.width,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: col, width: 1.5)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            // height: maxLines * 24.0,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  color: Colors.white,
                                  child: DropDownField(
                                    controller: clientprofile,
                                    // controller: Nameoptional,
                                    hintText: "$projectdetail1",
                                    enabled: true,
                                    items: clientname,
                                    onValueChanged: (value) {
                                      setState(() {
                                        selectName = value;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                TextFormField(
                                  controller: meetingTime,
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 1.5)),
                                      hintText: '$meetingtime1'),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Container(
                                  color: Colors.white,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 1.5)),
                                      hintText: "$country1",
                                    ),
                                    // controller: selectCountry,
                                    enabled: true,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                TextFormField(
                                  controller: deadline,
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 1.5)),
                                      hintText: '${deadline1.toDate()}'),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                TextFormField(
                                  controller: keyword,
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 1.5)),
                                      hintText: '$keyword1'),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Container(
                                  height: 135,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.blue, width: 1.5)),
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Text('Meeting Prior'),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Checkbox(
                                            value: meetings[0] == 1,
                                            onChanged: (bool value) {
                                              setState(() {
                                                checkboxValue = value;
                                                if (value) {
                                                  selectedPrior.add(1);

                                                  print(selectedPrior);
                                                } else {
                                                  selectedPrior.remove(1);
                                                  print(selectedPrior);
                                                }
                                              });
                                            },
                                          ),
                                          Text('1 Hour'),
                                          Checkbox(
                                            value: meetings[1] == 2,
                                            onChanged: (value) {
                                              if (value) {
                                                selectedPrior.add(2);
                                                print(selectedPrior);
                                              } else {
                                                selectedPrior.remove(2);
                                                print(selectedPrior);
                                              }
                                              setState(() {
                                                checkboxValue2 = value;
                                              });
                                            },
                                          ),
                                          Text(('2 Hour')),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 7),
                                                child: Checkbox(
                                                  value: meetings[2] == 3,
                                                  onChanged: (bool value) {
                                                    if (value) {
                                                      selectedPrior.add(3);
                                                      print(selectedPrior);
                                                    } else
                                                      selectedPrior.remove(3);
                                                    print(selectedPrior);
                                                    setState(() {
                                                      checkboxValue3 = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                              Text(('3 Hour')),
                                              Checkbox(
                                                value: meetings[3] == 4,
                                                onChanged: (bool value) {
                                                  if (value) {
                                                    selectedPrior.add(0);
                                                  } else {
                                                    selectedPrior.remove(0);
                                                  }
                                                  setState(() {
                                                    checkboxValue4 = value;
                                                  });
                                                },
                                              ),
                                              GestureDetector(
                                                  onTap: () async {
                                                    final int result =
                                                        await Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        CustomReminder()));
                                                    selectedPrior.add(num.parse(
                                                        result.toString()));
                                                    print(selectedPrior);
                                                  },
                                                  child: Text(('Custom'))),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: 300,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          color: Colors.blue,
                          onPressed: () {},
                          child: Text(
                            'Save',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
