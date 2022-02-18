import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meetings_manager/Screens/NewClient.dart';
import 'package:meetings_manager/Screens/updateclient.dart';
import 'package:meetings_manager/models/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meetings_manager/models/event_model.dart';

class Deadline extends StatefulWidget {
  @override
  _DeadlineState createState() => _DeadlineState();
}

class _DeadlineState extends State<Deadline> {
  // Timestamp formater;

  bool isLoading = false;
  List<EventModel> nameList = [];
  List<EventModel> filterednameList = [];

  TextEditingController search = TextEditingController();
  // String names;
  getdata() async {
    final firestore = FirebaseFirestore.instance;
    await firestore
        .collection("NewClient")
        .get()
        .then((QuerySnapshot snapshot) => snapshot.docs.forEach((e) {
              // print(e.data());
              nameList.add(EventModel.fromMap(e.data()));
              nameList.sort(
                  (a, b) => a.deadline.toDate().compareTo(b.deadline.toDate()));
              print(e.data()['deadline']);
            }));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  // onItemChanged(String value) {}
  // onSearchchanged() {
  //   print(search);
  // }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formatDate = DateFormat('yyyy-MM-dd').format(now);
    String userId;

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
          title: Text('DEADLINE'),
          centerTitle: true,
        ),
        body: Stack(children: [
          SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          filterednameList = nameList
                                  .where((element) => element.deadline
                                      .toString()
                                      .toLowerCase()
                                      .contains(value.toString().toLowerCase()))
                                  .toList() ??
                              [];
                          setState(() {});
                          print(
                              "THIS IS THE LENGHT OF FILTERD LIST ${filterednameList.length}");
                        }
                      },
                      controller: search,
                      decoration: InputDecoration(
                          hintText: 'Search Here...',
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Icon(Icons.search)),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1.5))),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              isLoading
                  ? CircularProgressIndicator()
                  : nameList.length == 0
                      ? Container(
                          child: Center(child: Text('Noting Found')),
                        )
                      : Stack(children: [
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SingleChildScrollView(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: search.text.isEmpty
                                            ? nameList.length
                                            : filterednameList.length,
                                        itemBuilder: (context, index) {
                                          EventModel name = search.text.isEmpty
                                              ? nameList[index]
                                              : filterednameList[index];
                                          return Stack(children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 26, top: 7),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.186,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.856,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: col, width: 1.5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                padding: EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    RichText(
                                                        text:
                                                            TextSpan(children: <
                                                                TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '${name.clientName}',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black)),
                                                      TextSpan(
                                                          text: '',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey)),
                                                    ])),
                                                    SizedBox(
                                                      height: 7,
                                                    ),
                                                    RichText(
                                                        text:
                                                            TextSpan(children: <
                                                                TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '${name.userName}',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black)),
                                                      TextSpan(
                                                          text: '',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey)),
                                                    ])),
                                                    SizedBox(
                                                      height: 7,
                                                    ),
                                                    RichText(
                                                        text:
                                                            TextSpan(children: <
                                                                TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              'Upcoming Meeting :',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black)),
                                                      TextSpan(
                                                          text:
                                                              '${name.meetingTime}',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey)),
                                                    ])),
                                                    SizedBox(
                                                      height: 7,
                                                    ),
                                                    RichText(
                                                        text:
                                                            TextSpan(children: <
                                                                TextSpan>[
                                                      TextSpan(
                                                          text: 'Keyword :',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black)),
                                                      TextSpan(
                                                          text:
                                                              '${name.keyword}',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey)),
                                                    ])),
                                                    SizedBox(
                                                      height: 0,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      // crossAxisAlignment: CrossAxisAlignment.end,
                                                      children: [
                                                        RichText(
                                                            text: TextSpan(
                                                                children: <
                                                                    TextSpan>[
                                                              TextSpan(
                                                                  text:
                                                                      'Deadline :',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black)),
                                                              TextSpan(
                                                                  text:
                                                                      ' ${name.deadline.toDate()}',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .grey)),
                                                            ])),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10),
                                                          child: Align(
                                                            alignment: Alignment
                                                                .bottomRight,
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                userId =
                                                                    name.uid;

                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            UpdateClient(
                                                                              userclient: userId,
                                                                            )));
                                                                //getuid();
                                                              },
                                                              child: Container(
                                                                // margin: EdgeInsets.only(left: 0, right:10  , bottom:20 ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Colors
                                                                              .grey[
                                                                          300]),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              180),
                                                                ),

                                                                child:
                                                                    CircleAvatar(
                                                                  radius: 15,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  child: Icon(
                                                                      Icons
                                                                          .navigate_next,
                                                                      color: Colors
                                                                          .blue),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ]);
                                        }))
                              ],
                            ),
                          ),
                        ])
            ],
            // children: snapshot.data.docs.map((document) {

            // names = document.data()["clientName"];
          )),
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 60,
                width: 60,
                child: FloatingActionButton(
                  onPressed: () {
                    Get.to(NewClient());
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
          )
        ]));
  }
}
