import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetings_manager/Screens/Login.dart';
import 'package:meetings_manager/models/color.dart';
import 'package:meetings_manager/models/Date_time.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[200],
      extendBodyBehindAppBar: false,
      appBar: new AppBar(
        title: new Center(child: new Text('SETTINGS')),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          // height: 550,
          height: MediaQuery.of(context).size.height * 0.74,
          width: MediaQuery.of(context).size.width,
          // width: 320,

          decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.blue, width: 1.5),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  'MEETINGS\nMANAGER',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 300,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          color: Colors.white,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Privacy Policy',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.grey[500]),
                              )),
                          onPressed: () {}),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 60,
                      width: 300,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          color: Colors.white,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Terms & Conditions',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.grey[500]),
                              )),
                          onPressed: () {
                            // Get.to(Datetime());
                          }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      width: 300,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          color: Colors.white,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'FAQ',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.grey[500]),
                              )),
                          onPressed: () {}),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      width: 300,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          color: Colors.white,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Login / Signup',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.grey[500]),
                              )),
                          onPressed: () {
                            Get.to(Login());
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
