import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
class ModelAddMeeting{
  final TextEditingController name = TextEditingController();
  final TextEditingController username = TextEditingController();
  final GlobalKey <FormState> _formkey = GlobalKey<FormState>();
  FirebaseFirestore firestore =FirebaseFirestore.instance;
  Future <void> Add(){

    // var firebaseUser =  FirebaseAuth.instance.currentUser;
    if(_formkey.currentState.validate()) {
      firestore.collection('Client Add Data').add({
        "Client Name": name.text,
        "Client UserName": username.text,
      });

    }
  }
}
