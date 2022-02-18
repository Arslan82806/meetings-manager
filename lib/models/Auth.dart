import 'package:cloud_firestore/cloud_firestore.dart';

class Cloudfirestore {
  final users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(String _name, String _email, String _password,
      String Confirmpassword, String uid) {
    // Call the user's CollectionReference to add a new user
    return users.doc(uid).set({
      'name': _name,
      'email': _email, // Harshad@gmail.com
      'password': _password,
      // 'Confirmpassword': ,// Strong Password
      // Haseeb Arshad
      'uid': uid,
    });
  }

  Future getUsersList() async {
    List itemsList = [];

    try {
      await users.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data());
        });
      });

      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
