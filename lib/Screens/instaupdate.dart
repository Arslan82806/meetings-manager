import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Instaupdate extends StatefulWidget {
  final String user;

  const Instaupdate({Key key, this.user}) : super(key: key);
  @override
  _InstaupdateState createState() => _InstaupdateState();
}

class _InstaupdateState extends State<Instaupdate> {
  String insta;
  bool meeting = false;

  getdata() async {
    setState(() {
      meeting = true;
    });
    final adddata = FirebaseFirestore.instance.collection('NewClient');

    await adddata.doc(widget.user).get().then((documentSnapshot) {
      print(widget.user);
      insta = documentSnapshot.data()['instagaram'];
      print(insta);
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

  // final  insta;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController instagram = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // print(insta);
    print(widget.user);

    // instagram = insta;
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
        title: Text('INSTAGARAM'),
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
                        child: Image.asset('images/instagaram.png'),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Form(
                          key: _formkey,
                          child: TextFormField(
                            controller: instagram,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 1.5)),
                                hintText: '$insta'),
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
                            Navigator.pop(context, instagram.text);
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
