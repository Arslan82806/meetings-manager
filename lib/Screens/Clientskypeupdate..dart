import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientSkype extends StatefulWidget {
  final String user;

  const ClientSkype({Key key, this.user}) : super(key: key);
  @override
  _ClientSkypeState createState() => _ClientSkypeState();
}

class _ClientSkypeState extends State<ClientSkype> {
  String skype;
  String skype1;
  bool meeting = false;

  getdata() async {
    setState(() {
      meeting = true;
    });
    final adddata = FirebaseFirestore.instance.collection('NewClient');

    await adddata.doc(widget.user).get().then((documentSnapshot) {
      print(widget.user);
      skype1 = documentSnapshot.data()['skype'];
      print(skype1);
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

  TextEditingController skyp = new TextEditingController();
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
        title: Text('SKYPE'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[200],
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 150,
                  child: Image.asset('images/Skype.png'),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    controller: skyp,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.5)),
                        hintText: 'Type or Paste Link'),
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
                      Navigator.pop(context, skyp.text);
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
