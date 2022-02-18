import 'package:country_code_picker/country_code_picker.dart';
import 'package:meetings_manager/Screens/home_screen.dart';
import 'package:meetings_manager/models/event_model.dart';
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

class NewClient extends StatefulWidget {
  final String userclient;

  const NewClient({Key key, this.userclient}) : super(key: key);
  @override
  _NewClientState createState() => _NewClientState();
}

class _NewClientState extends State<NewClient> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String uniqueId = DateTime.now().millisecondsSinceEpoch.toString();
  double date;
  DateTime datetime = DateTime.now();
  Timestamp myTimeStamp;
  _selectedTodoDate(BuildContext context) async {
    var _pickedDate = await showDatePicker(
        context: context,
        initialDate: datetime,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
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
        mins = timeFormatter(time.minute);
        hour = timeFormatter(time.hour);
        meetingTime.text = "$hour.$mins";
      });
    }
    print(time);
  }
  // }

  bool checkboxValue = false;
  bool checkboxValue2 = false;
  bool checkboxValue3 = false;
  bool checkboxValue4 = false;
  bool enabledinsta = false;
  bool enabledfacebook = false;
  bool enabledskype = false;
  bool enabledzoom = false;
  String choosevalue;
  // String uid =  FirebaseAuth.instance.currentUser.uid.toString();
  final TextEditingController nameoptional = TextEditingController();
  final TextEditingController country = TextEditingController();
  final TextEditingController clientprofile = TextEditingController();
  final TextEditingController meetingTime = TextEditingController();
  var _deadline = TextEditingController();
  final TextEditingController keyword = TextEditingController();
  final TextEditingController meetingPrior = TextEditingController();
  final TextEditingController selectCountry = TextEditingController();
  String selectCity = "";
  String selectName = "";

  // String name, username;
  TextEditingController name = new TextEditingController();
  TextEditingController username = new TextEditingController();
  String insta = '';
  String fb = '';
  String skype = '';
  String zoom = '';

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
  final adddata = FirebaseFirestore.instance.collection('NewClient');

  // ignore: non_constant_identifier_names
  Future<void> Add() async {
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
      meetingPrior: selectedPrior,
      uid: uniqueId,
    );
    EventModel eventModel = eventModel2;
    if (_formkey.currentState.validate()) {
      adddata.doc(uniqueId).set(eventModel.toMap());
      print('id= $uniqueId');
    }
  }

  List<int> selectedPrior = [
    // 1 : true,
    // 2 : false,
    // 3 : false
  ];
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

  @override
  Widget build(BuildContext context) {
    mins = timeFormatter(time.minute);
    hour = timeFormatter(time.hour);
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
        title: Text('NEW CLIENT'),
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
                      padding:
                          const EdgeInsets.only(left: 10, right: 10.0, top: 10),
                      child: Form(
                        key: _formkey,
                        child: SingleChildScrollView(
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
                                            color: Colors.blue, width: 1.5)),
                                    hintText: 'Client Name (Optional)'),
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
                                                            builder: (context) =>
                                                                Instagaram()));
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
                                                            Icons.check_circle,
                                                            size: 15,
                                                            color: Colors.green,
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
                                                                FaceBook()));
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
                                                    opacity:
                                                        fb.isNotEmpty ? 1 : 0.6,
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
                                                            Icons.check_circle,
                                                            size: 15,
                                                            color: Colors.green,
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
                                                            builder:
                                                                (context) =>
                                                                    Skype()));
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
                                                            Icons.check_circle,
                                                            size: 15,
                                                            color: Colors.green,
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
                                                                    Zoom()));
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
                                                            Icons.check_circle,
                                                            size: 15,
                                                            color: Colors.green,
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
                        TextFormField(
                          maxLines: 3,
                          controller: clientprofile,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 1.5)),
                              hintText: 'Project Detail'),
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
                              hintText: 'Meeting Time : $hour . $mins'),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                            color: Colors.white,
                            child: TextFormField(
                              controller: country,
                              decoration: InputDecoration(
                                  prefixIcon: CountryCodePicker(
                                textStyle: TextStyle(color: Colors.blue),
                                initialSelection: 'PAKISTAN',
                                showCountryOnly: false,
                                showFlag: true,
                                enabled: true,
                                alignLeft: true,
                                comparator: (a, b) => a.name.compareTo(b.name),
                                onChanged: (value) {
                                  country.text = value.name;
                                  print(country.text);
                                },
                              )),
                            )),
                        SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                          controller: _deadline,
                          decoration: InputDecoration(
                              prefixIcon: InkWell(
                                onTap: () {
                                  _selectedTodoDate(context);
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
                                    value: checkboxValue2,
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 7),
                                        child: Checkbox(
                                          value: checkboxValue3,
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
                                        value: checkboxValue4,
                                        onChanged: (bool value) {
                                          if (value) {
                                            selectedPrior.add(0);
                                            print(selectedPrior);
                                          } else {
                                            selectedPrior.remove(0);
                                            print(selectedPrior);
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
                    Add();
                    Get.back();
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
      ),
    );
  }
}
