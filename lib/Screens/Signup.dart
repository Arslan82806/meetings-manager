

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meetings_manager/Screens/Login.dart';

import 'package:meetings_manager/models/Auth.dart';

import 'package:meetings_manager/Screens/home.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String _name, _email, _password, _confirmpassword;
  bool _obsecureText = false;
  bool _obsecureText2 = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        Get.to(Home());
      }
    });
  }

  void _toggle() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  void _toggle1() {
    setState(() {
      _obsecureText2 = !_obsecureText2;
    });
  }

  @override
  // void initState() {
  //   _passwordvisible = true;
  //   super.initState();
  // }

  Future<void> signup() async {
    if (formkey.currentState.validate()) {
      formkey.currentState.save();
      try {
        print(_email.length);
        print(_password);
        final userCredential = await _auth.createUserWithEmailAndPassword(
            email: _email.trim(), password: _password);
        String uid = FirebaseAuth.instance.currentUser.uid;
        await Cloudfirestore()
            .addUser(_name, _email, _password, _confirmpassword, uid);
        uid = userCredential.user.uid;
        // User user = result.user;
        Get.to(Home());
        return userCredential;
      } on FirebaseAuthException catch (e) {
        Get.defaultDialog(
          title: "ERROR!!!",
          content: Center(
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                      "There was an error with your information.Please Try Again "),
                )),
              ],
            ),
          ),
          textCancel: "Cancel",
          textConfirm: "OK",
          onCancel: () {},
          onConfirm: () {
            print('ababababab');
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Signup()));
          },
        );
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
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
              child: SingleChildScrollView(
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
                          key: formkey,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                TextFormField(
                                  // ignore: missing_return
                                  validator: (input) {
                                    if (input.isEmpty)
                                      return "Please Enter Name";
                                  },
                                  decoration: InputDecoration(
                                      hintText: 'Name',
                                      fillColor: Colors.white,
                                      filled: true,
                                      prefixIcon: Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Icon(Icons.person_sharp)),
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 1.5))),
                                  onSaved: (input) => _name = input,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  // ignore: missing_return
                                  validator: (input) {
                                    if (input.isEmpty)
                                      return "Please Enter Email";
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

                                  onSaved: (input) => _email = input,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  obscureText: _obsecureText,
                                  // ignore: missing_return
                                  validator: (input) {
                                    if (input.isEmpty)
                                      return "Please Enter Password";
                                    else if (input.length < 6)
                                      return "The Password required 6 characters or more";
                                  },

                                  decoration: InputDecoration(
                                      hintText: 'Password',
                                      fillColor: Colors.white,
                                      filled: true,
                                      prefixIcon: Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Icon(Icons.vpn_key_sharp)),
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 1.5)),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obsecureText
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                        ),
                                        onPressed: _toggle,
                                      )),

                                  onSaved: (input) => _password = input,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  obscureText: _obsecureText2,
                                  // ignore: missing_return
                                  validator: (input) {
                                    if (_password != _confirmpassword)
                                      return "Password is not confirm";

                                    if (input.isEmpty)
                                      return "Please Enter Confirm Password";
                                    if (input.length < 6)
                                      return "The Password required 6 characters or more";
                                  },
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(_obsecureText2
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: _toggle1,
                                      ),
                                      hintText: 'Confirm Password',
                                      fillColor: Colors.white,
                                      filled: true,
                                      prefixIcon: Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Icon(Icons.vpn_key_sharp)),
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 1.5))),
                                  onSaved: (input) => _confirmpassword = input,
                                ),
                                SizedBox(
                                  height: 10,
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
                                      'Sign Up',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    onPressed: () async {
                                      await signup();
                                      Get.to(Login());
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 40,
                                      child: GestureDetector(
                                          onTap: () {
                                            Get.to(Login());
                                          },
                                          child:
                                              Image.asset('images/back.png')),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      child: Text(
                                        'Go to Login Page',
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
            Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('By Confirming you agree with our'),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Terms & Condition',
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
