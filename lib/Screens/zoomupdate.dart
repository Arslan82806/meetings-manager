import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Zoomupdate extends StatefulWidget {
  final String user;

  const Zoomupdate({Key key, this.user}) : super(key: key);
  @override
  _ZoomupdateState createState() => _ZoomupdateState();
}

class _ZoomupdateState extends State<Zoomupdate> {
  String facebook;
  bool meeting = false;

  getdata() async {
    setState(() {
      meeting = true;
    });
    final adddata = FirebaseFirestore.instance.collection('ClientAddData');

    await adddata.doc(widget.user).get().then((documentSnapshot) {
      print(widget.user);
      facebook = documentSnapshot.data()['zoom'];
      print(facebook);
    }

        // print(name1);

        );
    setState(() {
      meeting = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  TextEditingController fb = new TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text('Zoom'),
        centerTitle: true,
      ),
      body: meeting == true
          ? Center(child: CircularProgressIndicator())
          : Container(
              color: Colors.grey[200],
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 150,
                        child: Image.asset('images/Zoom.png'),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Form(
                          key: _formkey,
                          child: TextFormField(
                            controller: fb,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 1.5)),
                                hintText: '$facebook'),
                          ),
                        ),
                      ),
                      Container(
                        width: 325,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          color: Colors.blue,
                          onPressed: () {
                            Navigator.pop(context, fb.text);
                          },
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
            ),
    );
  }
}
