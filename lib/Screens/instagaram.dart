import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Instagaram extends StatefulWidget {
  final String user;

  const Instagaram({Key key, this.user}) : super(key: key);
  @override
  _InstagaramState createState() => _InstagaramState();
}

class _InstagaramState extends State<Instagaram> {
  String insta;
  bool meeting = false;
  final adddata = FirebaseFirestore.instance.collection('ClientAddData');
  getdata() async {
    setState(() {
      meeting = true;
    });
    await adddata.doc(widget.user).get().then((documentSnapshot) {
      insta = documentSnapshot.data()['instagaram'];
      print('PPPPPPPPPPPPPPPP $insta PPPPPPPPPPPPP');
      instagram.text = insta;
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
    // print(widget.user);
    print('OOOOOOOOOOOOOOOOO ${widget.user} OOOOOOOOOOOOOOOOOOOO');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context, instagram.text);
          },
          child: Image.asset(
            'images/back.png',
            scale: 10,
          ),
        ),
        title: Text('INSTAGARAM'),
        centerTitle: true,
      ),
      body:
          // meeting == true
          //     ? Center(child: CircularProgressIndicator())
          //     :
          Container(
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
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1.5)),
                          hintText: insta == null
                              ? 'https://www.instagram.com/'
                              : '${instagram.text}'),
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
                      setState(() {
                        Navigator.pop(context, instagram.text);
                      });
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
