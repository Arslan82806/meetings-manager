import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Zoom extends StatefulWidget {
  final String user;

  const Zoom({Key key, this.user}) : super(key: key);
  @override
  _ZoomState createState() => _ZoomState();
}

class _ZoomState extends State<Zoom> {
  String zm;
  bool meeting = false;
  final adddata = FirebaseFirestore.instance.collection('ClientAddData');
  getdata() async {
    setState(() {
      meeting = true;
    });

    await adddata.doc(widget.user).get().then((documentSnapshot) {
      zm = documentSnapshot.data()['zoom'];
      print('PPPPPPPPPPPPPPPP $zm PPPPPPPPPPPPP');
      zoom.text = zm;
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

  TextEditingController zoom = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context, zoom.text);
          },
          child: Image.asset(
            'images/back.png',
            scale: 10,
          ),
        ),
        title: Text('ZOOM'),
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
                  child: Image.asset('images/Zoom.png'),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    controller: zoom,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.5)),
                        hintText: zm == null
                            ? 'https://www.zoom.com/'
                            : '${zoom.text}'),
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
                      Navigator.pop(context, zoom.text);
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
