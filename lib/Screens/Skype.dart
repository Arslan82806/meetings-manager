import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Skype extends StatefulWidget {
  final String user;

  const Skype({Key key, this.user}) : super(key: key);
  @override
  _SkypeState createState() => _SkypeState();
}

class _SkypeState extends State<Skype> {
  String sk;
  bool meeting = false;
  final adddata = FirebaseFirestore.instance.collection('ClientAddData');
  getdata() async {
    setState(() {
      meeting = true;
    });
    await adddata.doc(widget.user).get().then((documentSnapshot) {
      sk = documentSnapshot.data()['skype'];
      print('PPPPPPPPPPPPPPPP $sk PPPPPPPPPPPPP');
      skype.text = sk;
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

  // getdata() async {}
  TextEditingController skype = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context, skype.text);
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
                    controller: skype,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.5)),
                        hintText: sk == null
                            ? 'https://www.skype.com/'
                            : '${skype.text}'),
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
                      Navigator.pop(context, skype.text);
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
