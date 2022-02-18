import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:meetings_manager/models/event_model.dart';

import '../main.dart';
import 'instagaram.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetings_manager/Screens/CustomReminder.dart';
import 'package:meetings_manager/Screens/Facebook.dart';
import 'package:meetings_manager/Screens/instagaram.dart';
import 'package:meetings_manager/Screens/zoom.dart';
import 'package:meetings_manager/models/color.dart';
import 'Skype.dart';
import 'package:intl/intl.dart';
import 'package:country_code_picker/country_code_picker.dart';

class Addmeeting extends StatefulWidget {
  @override
  _AddmeetingState createState() => _AddmeetingState();
}

class _AddmeetingState extends State<Addmeeting> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String uniqueId = DateTime.now().millisecondsSinceEpoch.toString();
  double date;
  DateTime datetime;
  Timestamp myTimeStamp;
  int check1 = 0, check2 = 0, check3 = 0, check4 = 0;
  List<EventModel> nameList;
  String c1;
  List<int> c2 = [];

  selectedTodoDate(BuildContext context) async {
    datetime = DateTime.now();

    DateTime _pickedDate = (await showDatePicker(
        context: context,
        initialDate: datetime,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100)));

    _deadline.text;

    DateTime.fromMicrosecondsSinceEpoch(_pickedDate.microsecondsSinceEpoch);
    DateTime.parse(_pickedDate.toString());
    // DateTime.parse(date.toDate().toString());
    print('**************$_pickedDate**************');
    if (_pickedDate != null) {
      //

      setState(() {
        datetime = _pickedDate;

        String formattedDate = DateFormat("dd-MM-yyyy").format(datetime);

        myTimeStamp = Timestamp.fromDate(datetime);
        _deadline.text = formattedDate;
      });
    }
  }

  _selectedTodoTime(BuildContext context) async {
    var _pickedTime = await showTimePicker(
      initialTime: time,
      context: context,
    );
    if (_pickedTime != null) {
      setState(() {
        time = _pickedTime;
        // String timeFormatter = DateFormat('HH:mm').format(datetime);
        mins = timeFormatter(time.minute);
        hour = timeFormatter(time.hour);
        meetingTime.text = "$hour:$mins";
      });
    }
    print('++++++++++++++++++$time++++++++++++++++');
  }

  // }
  bool meeting = false;
  bool checkboxValue = false;
  bool checkboxValue2 = false;
  bool checkboxValue3 = false;
  bool checkboxValue4 = false;
  bool enabledinsta = false;
  bool enabledfacebook = false;
  bool enabledskype = false;
  bool enabledzoom = false;
  EventModel selectedModel;
  String choosevalue;
  // String uid =  FirebaseAuth.instance.currentUser.uid.toString();
  final TextEditingController nameoptional = TextEditingController();
  final TextEditingController country = TextEditingController();
  final TextEditingController clientprofile = TextEditingController();
  final TextEditingController meetingTime = TextEditingController();
  final TextEditingController _deadline = TextEditingController();
  final TextEditingController keyword = TextEditingController();
  final TextEditingController meetingPrior = TextEditingController();
  final TextEditingController selectCountry = TextEditingController();
  String selectCity = "";
  String selectName = "";
  List<String> clientusername;
  // String name, username;
  TextEditingController name = new TextEditingController();
  TextEditingController username = new TextEditingController();
  String insta = '';
  String fb = '';
  String skype = '';
  String zoom = '';
  List<EventModel> attachmeetings;
  List<String> cusername = [];
  String clientName1;
  String userName1;
  String insta1;
  String fb1;
  String sk1;
  String zoom1;
  String country1;
  String profile;
  List<int> notificationtime = [];
  List<EventModel> model = [];
  int c3;

  bool isloading = false;
  @override
  void initState() {
    super.initState();
    getList();
    print(
        '--------------hamza -${eventModelList.length}------lower-------------');
    setState(() {
      schaduleNotification1();
    });
  }

  final addData = FirebaseFirestore.instance.collection('ClientAddData');
  List<EventModel> eventModelList = [];
  getList() async {
    setState(() {
      meeting = true;
    });
    await addData
        .get()
        .then((documentSnapshot) => documentSnapshot.docs.forEach((e) {
              // clientName1 = e.data()['clientName'];
              notificationtime = List.from(e.data()['meetingPrior']);
              EventModel eventModel = EventModel.fromMap(e.data());
              eventModelList.add(eventModel);
              clientname.add(eventModel.userName);
              hamza.add(eventModel);
              print(
                  "--------------hamza list ka data---${hamza.length}--------------------------------");
              // c1 = eventModel.userName;
              // // cusername.add(eventModel.meetingPrior.toString());

              // print('JJJJJJJJJJJJJJJJJ $cusername GGGGGGGGGGGGGGGG');
            }));

    setState(() {
      meeting = false;
    });
  }

  List<String> clientname = [];
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
  List<String> usersname = [];

  final adddata = FirebaseFirestore.instance.collection('ClientAddData');

  // ignore: non_constant_identifier_names
  Future<void> add() async {
    var eventModel2 = EventModel(
      clientName: name.text,
      userName: username.text,
      instagaram: insta,
      facebook: fb,
      skype: skype,
      zoom: zoom,
      clientProfile: clientprofile.text,
      meetingTime: meetingTime.text,
      selectCountry: country.text,
      deadline: myTimeStamp,
      keyword: keyword.text,
      meetingPrior: [check1, check2, check3, check4],
      uid: uniqueId,
    );
    EventModel eventModel = eventModel2;
    if (_formkey.currentState.validate()) {
      adddata.doc(uniqueId).set(eventModel.toMap());
      print('id= $uniqueId');
    }
  }

  List<int> selectedPrior = [];
  timeFormatter(number) {
    //String str;
    if (number > 9) {
      return number.toString();
    } else {
      //str = '0'+number.toString();
      return '0' + number.toString();
    }
  }

  TimeOfDay time = TimeOfDay.now();

  TimeOfDay picked;
  String hour;
  String mins;
  String d;
  String mins2;
  int c4;
  int c5;
  List hamza = [];
  @override
  Widget build(BuildContext context) {
// -------------------------------------------------------------------------------------------------------------

    // for (int i = 0; i < eventModelList.length; i++) {
    //   if (eventModelList[i].meetingPrior.contains(DateTime.now()))
    //     c1 = eventModelList[i].meetingTime;
    //   c2 = eventModelList[i].meetingPrior;
    //   // print('JJJJJJJJJJJJJJJJJ $c1 JJJJJJJJJJJJJJJj');
    //   print('GGGGGGGGGGGGGGGGG $c2 GGGGGGGGGGGGGGGG');

    //   c3 = c2[0];
    //   c4 = c2[1];
    //   for (int j = 0; j < c2.length; j++) {
    //     c5 = c2[j];
    //     print('OOOOOOOOOOOOOOOOOOOOO $c5 OOOOOOOOOOOOOOOOOOO');
    //   }
    //   hamza = eventModelList;
    //   print('--------------hamza -${hamza.length}------upper-------------');

    // }
    // List<DateTime> days = [];
    // print('WWWWWWWWWWWWWWWWWW $days WWWWWWWWWWW');

    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(
              'images/back.png',
              scale: 10,
            ),
          ),
          title: Text('NEW MEETING'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
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
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  controller: name,
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 1.5)),
                                      // ignore: unrelated_type_equality_checks
                                      hintText: 'Client Name'),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
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
                                              color: Colors.blue, width: 1.5)),
                                      hintText: 'Client Username'),
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
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Contact Info'),
                                        ),
                                        SizedBox(
                                          height: 0,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
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
                                                                      Instagaram(
                                                                        user:
                                                                            insta1,
                                                                      )));
                                                  setState(() {
                                                    insta = result;
                                                    print(
                                                        'JJJJJJJJJJJJJJJJJJJJ $insta JJJJJJJJJJJJJJJ');
                                                  });

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
                                                      opacity: insta.isNotEmpty
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
                                                      child: insta.isNotEmpty
                                                          ? Icon(
                                                              Icons
                                                                  .check_circle,
                                                              size: 15,
                                                              color:
                                                                  Colors.green,
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
                                                              builder:
                                                                  (context) =>
                                                                      FaceBook(
                                                                        user:
                                                                            insta1,
                                                                      )));
                                                  fb = result;
                                                  print(insta);
                                                  setState(() {
                                                    // enabledinsta = true;
                                                    if (fb.isNotEmpty) {
                                                      enabledfacebook = true;
                                                    } else {
                                                      enabledfacebook = false;
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
                                                              color:
                                                                  Colors.green,
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
                                                                  Skype(
                                                                      user:
                                                                          insta1)));
                                                  skype = result;
                                                  print(skype);
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
                                                      opacity: skype.isNotEmpty
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
                                                      child: skype.isNotEmpty
                                                          ? Icon(
                                                              Icons
                                                                  .check_circle,
                                                              size: 15,
                                                              color:
                                                                  Colors.green,
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
                                                              builder:
                                                                  (context) =>
                                                                      Zoom(
                                                                        user:
                                                                            insta1,
                                                                      )));
                                                  zoom = result;
                                                  print(zoom);
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
                                                      opacity: zoom.isNotEmpty
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
                                                              color:
                                                                  Colors.green,
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
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.blue, width: 1.5),
                              color: Colors.white,
                            ),
                            child: DropDownField(
                              value: clientusername,
                              controller: clientprofile,
                              hintText: "Attach Client Profile (Optional)",
                              enabled: true,
                              items: clientname,
                              onValueChanged: (value) {
                                setState(() {
                                  profile = value;

                                  if (clientname.contains(profile)) {
                                    selectedModel = eventModelList.firstWhere(
                                        (element) =>
                                            element.userName == profile);
                                    clientName1 = selectedModel.clientName;
                                    userName1 = selectedModel.userName;
                                    insta1 = selectedModel.uid;
                                    country1 = selectedModel.selectCountry;
                                    name.text = '$clientName1';
                                    username.text = '$userName1';
                                    country.text = '$country1';
                                    // insta = '$insta1';

                                    print(
                                        'yuguiyjbaUIFBASHBcilayDGcfwsdfbhAUIdvf');
                                    print(
                                        'KKKKKKKKKKKKKKKKKKKK $country1 KKKKKKKKKKKKKKKK');
                                    print(selectedModel);
                                  } else {
                                    name.text = 'Enter User Name';
                                  }
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
                                prefixIcon: InkWell(
                                    onTap: () {
                                      _selectedTodoTime(context);
                                    },
                                    child: Icon(Icons.lock_clock)),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 1.5)),
                                hintText: 'Meeting Time :'),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.blue, width: 1.5),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                                controller: country,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: CountryCodePicker(
                                      textStyle: TextStyle(color: Colors.blue),
                                      initialSelection:
                                          country.text ?? 'PAKISTAN',
                                      showCountryOnly: false,
                                      showFlag: true,
                                      enabled: true,
                                      alignLeft: true,
                                      comparator: (a, b) =>
                                          a.name.compareTo(b.name),
                                      onChanged: (value) {
                                        country.text = value.code;
                                        print(country.text);
                                      },
                                    ))),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          TextFormField(
                            controller: _deadline,
                            decoration: InputDecoration(
                                prefixIcon: InkWell(
                                  onTap: () {
                                    selectedTodoDate(context);
                                  },
                                  child: Icon(Icons.calendar_today),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 1.5)),
                                hintText: 'DeadLine (Optional)'),
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
                                hintText: 'KeyWord'),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Container(
                            height: 135,
                            width: 300,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.blue, width: 1.5)),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text('Meeting Prior'),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Checkbox(
                                      value: checkboxValue,
                                      onChanged: (bool value) {
                                        setState(() {
                                          checkboxValue = value;
                                          if (value) {
                                            // selectedPrior.add(1);
                                            check1 = 1;
                                            print(selectedPrior);
                                          } else {
                                            selectedPrior.add(0);
                                            selectedPrior.remove(1);

                                            print(selectedPrior);
                                          }
                                        });
                                      },
                                    ),
                                    Text('1 Hour'),
                                    Checkbox(
                                      value: checkboxValue2,
                                      onChanged: (value) {
                                        if (value) {
                                          // selectedPrior.add(2);
                                          check2 = 2;
                                          print(selectedPrior);
                                        } else {
                                          selectedPrior.add(0);
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 7),
                                          child: Checkbox(
                                            value: checkboxValue3,
                                            onChanged: (bool value) {
                                              if (value) {
                                                // selectedPrior.add(3);
                                                check3 = 3;
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
                                          value: checkboxValue4,
                                          onChanged: (bool value) {
                                            if (value) {
                                              check4 = 4;
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
                                                          builder: (context) =>
                                                              CustomReminder()));
                                              selectedPrior.add(
                                                  num.parse(result.toString()));
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
                    onPressed: () {
                      // add();
                      schaduleNotification1();
                      // Get.to(HomeTab());
                    },
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

  // Future<void> schaduleNotification() async {
  //   print('--------------hamza -${hamza.length}------lower-------------');
  //   for (int i = 0; i < eventModelList.length; i++) {
  //     if (eventModelList[i].meetingPrior.contains(DateTime.now()))
  //       c1 = eventModelList[i].meetingTime;
  //     c2 = eventModelList[i].meetingPrior;
  //     // print('JJJJJJJJJJJJJJJJJ $c1 JJJJJJJJJJJJJJJj');
  //     c3 = c2[0];
  //     c4 = c2[1];
  //     for (int j = 0; j < c2.length; j++) {
  //       c5 = c2[j];
  //       print('OOOOOOOOOOOOOOOOOOOOO $c5 OOOOOOOOOOOOOOOOOOO');
  //     }
  //   }
  //   var scheduledNotificationDateTime =
  //       DateTime.now().add(new Duration(minutes: c5 ?? 0));
  //   print(
  //       'FFFFFFFFFFFFFFFFFFFFFFFFFFFFF $scheduledNotificationDateTime FFFFFFFFFFFFFFFFFFFFFFFFFFFF');
  //   print('SSSSSSSSSSSSSSSSSSS $c5 SSSSSSSSSSSSSSSSSS');

  //   var androidPlatformChannelSpecifics = AndroidNotificationDetails(
  //     'alarm_notif',
  //     'alarm_notif',
  //     'Channel for Alarm notification',
  //     icon: 'aaaa',
  //     // sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
  //     largeIcon: DrawableResourceAndroidBitmap('aaaa'),
  //   );

  //   var iOSPlatformChannelSpecifics = IOSNotificationDetails(
  //       // sound: 'a_long_cold_sting.wav',
  //       presentAlert: true,
  //       presentBadge: true,
  //       presentSound: true);
  //   var platformChannelSpecifics = NotificationDetails(
  //       android: androidPlatformChannelSpecifics,
  //       iOS: iOSPlatformChannelSpecifics);

  //   var x = await flutterLocalNotificationsPlugin.schedule(
  //       0,
  //       'Office',
  //       'GoodMorning ! Time For Office',
  //       scheduledNotificationDateTime,
  //       platformChannelSpecifics);
  //   return x;
  // }

  Future<void> schaduleNotification1() async {
    print(
        '--------------hamza -${eventModelList.length}------lower-------------');
    for (int i = 0; i < eventModelList.length; i++) {
      print("------------loo g loop chl ya------------------");
      c1 = eventModelList[i].meetingTime;
      c2 = eventModelList[i].meetingPrior;

      print('KKKKKKKKKKKKKKKKKK $c2 KKKKKKKKKKKKKKKKkk');
      // c3 = c2[0];
      // c4 = c2[1];
      for (int j = 0; j < c2.length; j++) {
        c5 = c2[j] * 10;

        print('OOOOOOOOOOOOOOOOOOOOO $c5 OOOOOOOOOOOOOOOOOOO');

        var scheduledNotificationDateTime =
            DateTime.now().add(new Duration(seconds: c5 ?? 0));
        print(
            'FFFFFFFFFFFFFFFFFFFFFFFFFFFFF $scheduledNotificationDateTime FFFFFFFFFFFFFFFFFFFFFFFFFFFF');
        print('SSSSSSSSSSSSSSSSSSS $c5 SSSSSSSSSSSSSSSSSS');

        var androidPlatformChannelSpecifics = AndroidNotificationDetails(
          'ala',
          'alarm_notif',
          'Channel for Alarm notification',
          icon: 'aaaa',
          // sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
          largeIcon: DrawableResourceAndroidBitmap('aaaa'),
        );

        var iOSPlatformChannelSpecifics = IOSNotificationDetails(
            // sound: 'a_long_cold_sting.wav',
            presentAlert: true,
            presentBadge: true,
            presentSound: true);
        var platformChannelSpecifics = NotificationDetails(
            android: androidPlatformChannelSpecifics,
            iOS: iOSPlatformChannelSpecifics);

        await flutterLocalNotificationsPlugin.schedule(
            j ?? 0,
            'Office',
            'GoodMorning ! Time For Office',
            scheduledNotificationDateTime,
            platformChannelSpecifics);
        print('After Wait');
        // await flutterLocalNotificationsPlugin.cancel(j);
      }
      return eventModelList;
    }
  }
}
