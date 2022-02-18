import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetings_manager/Screens/Signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meetings_manager/Screens/home.dart';

import 'home_screen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _email, _password, uid;
  bool _obsecureText = true;
  checkAuthentification() async {
    _auth.authStateChanges().listen((User user) {
      if (user != null) {
        print('ababababbababa');

        Get.to(Home());
        print('User login Successfully');
      } else {
        print('Login Unsuccessfully');
      }
    });
  }

  void _toggle() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  @override
  void initState() {
    super.initState();
    // this.checkAuthentification();
  }

  Future<void> login() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    // UserCredential user = await FirebaseAuth.instance.signInAnonymously();
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();

      try {
        final userCredential = await _auth
            .signInWithEmailAndPassword(email: _email, password: _password)
            .then((_) => Get.to(Home()));
        print('llllllllllllll');
        uid = FirebaseAuth.instance.currentUser.uid;

        uid = userCredential.user.uid;
        Get.to(Home());
        print('bababbabba');
        return uid;
      } on FirebaseAuthException catch (e) {
        Get.defaultDialog(
          title: "${e.message}",
          content: Center(
            child: Expanded(
              child: Text('Please Try Again'),
            ),
          ),
          textCancel: "Cancel",
          textConfirm: "OK",
          onConfirm: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()));
          },
          onCancel: () {},
        );
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width,
              // width: 320,

              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.blue, width: 1.5),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
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
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            TextFormField(
                              // ignore: missing_return
                              onSaved: (input) => _email = input,

                              // ignore: missing_return
                              validator: (input) {
                                if (input.isEmpty) return "Please Enter Email";
                              },
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(Icons.email)),
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1.5))),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              onSaved: (input) => _password = input,
                              obscureText: _obsecureText,
                              // ignore: missing_return
                              validator: (input) {
                                if (input.isEmpty)
                                  return "Please Enter Password";
                              },
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                        !_obsecureText
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color:
                                            Theme.of(context).primaryColorDark,
                                      ),
                                      onPressed: _toggle),
                                  hintText: 'Password',
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(Icons.vpn_key_sharp)),
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1.5))),
                            ),
                            Align(
                                alignment: Alignment.topRight,
                                child: Text('Forget Password?')),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 60,
                              width: 300,
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  color: Colors.blue,
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  onPressed: login),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  child: GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Image.asset('images/back.png')),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  child: Text(
                                    'Go to Settings',
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dont Have an Account?'),
                // ignore: deprecated_member_use
                FlatButton(
                  onPressed: () {
                    Get.to(Signup());
                  },
                  child: Text(
                    'CREATE NEW',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
