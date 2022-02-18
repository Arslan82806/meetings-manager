import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FaceBook extends StatefulWidget {
  final String user;

  const FaceBook({Key key, this.user}) : super(key: key);
  @override
  _FaceBookState createState() => _FaceBookState();
}

class _FaceBookState extends State<FaceBook> {
  String fb;
  bool meeting = false;
  final adddata = FirebaseFirestore.instance.collection('ClientAddData');
  getdata() async {
    setState(() {
      meeting = true;
    });

    await adddata.doc(widget.user).get().then((documentSnapshot) {
      fb = documentSnapshot.data()['facebook'];
      print('PPPPPPPPPPPPPPPP $fb PPPPPPPPPPPPP');
      facebook.text = fb;
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

  TextEditingController facebook = new TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context, facebook.text);
          },
          child: Image.asset(
            'images/back.png',
            scale: 10,
          ),
        ),
        title: Text('FACEBOOK'),
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
                  child: Image.asset('images/Facebook.png'),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Form(
                    key: _formkey,
                    child: TextFormField(
                      controller: facebook,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1.5)),
                          hintText: fb == null
                              ? 'https://www.instagram.com/'
                              : '${facebook.text}'),
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
                      Navigator.pop(context, facebook.text);
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
