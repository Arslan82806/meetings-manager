import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetings_manager/models/color.dart';

import 'Facebook.dart';
import 'Skype.dart';
import 'instagaram.dart';

class UpdateMeeting extends StatefulWidget {
  @override
  _UpdateMeetingState createState() => _UpdateMeetingState();
}

class _UpdateMeetingState extends State<UpdateMeeting> {
  @override
  Widget build(BuildContext context) {
    bool _checkbox = false;
    final maxLines = 5;
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
                      child: Column(
                        children: <Widget>[
                          TextFormField(
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
                                border:
                                    Border.all(color: Colors.blue, width: 1.5)),
                            height: 120,
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
                                          onTap: () {
                                            Get.to(Instagaram());
                                          },
                                          child: Image.asset(
                                            'images/instagaram.png',
                                            scale: 5.2,
                                          ),
                                        ),

                                        SizedBox(
                                          width: 2,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(FaceBook());
                                          },
                                          child: Image.asset(
                                            'images/Facebook.png',
                                            scale: 5.2,
                                          ),
                                        ),
                                        //
                                        SizedBox(
                                          width: 2,
                                        ),
                                        //
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(Skype());
                                          },
                                          child: Image.asset(
                                            'images/Skype.png',
                                            scale: 5.2,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        //
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(Instagaram());
                                          },
                                          child: Image.asset(
                                            'images/Zoom.png',
                                            scale: 5.2,
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
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                height: MediaQuery.of(context).size.height * 0.64,
                // width: MediaQuery.of(context).size.width,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: col, width: 1.5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: maxLines * 24.0,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 1.5)),
                                hintText: 'Attach Client Profile(Optional)'),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 1.5)),
                              hintText: 'Meeting Time'),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 1.5)),
                              hintText: 'Select Country'),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
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
                                    value: _checkbox,
                                    onChanged: (value) {
                                      setState(() {
                                        _checkbox = true;
                                      });
                                    },
                                  ),
                                  Text(('1 Hour')),
                                  Checkbox(
                                    value: _checkbox,
                                    onChanged: (value) {
                                      setState(() {
                                        _checkbox = true;
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
                                      Checkbox(
                                        value: _checkbox,
                                        onChanged: (value) {
                                          setState(() {
                                            _checkbox = true;
                                          });
                                        },
                                      ),
                                      Text(('3 Hour')),
                                      Checkbox(
                                        value: _checkbox,
                                        onChanged: (value) {
                                          setState(() {
                                            _checkbox = true;
                                          });
                                        },
                                      ),
                                      Text(('4 Hour')),
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
              Container(
                width: 300,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  color: Colors.blue,
                  onPressed: () {},
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
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
