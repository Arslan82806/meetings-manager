import 'package:cloud_firestore/cloud_firestore.dart';

class Calendar{
   // ignore: non_constant_identifier_names
   final String Uid;
   // ignore: non_constant_identifier_names
   final String ClientName;
   final String UserName;
   final String ContactInfo;
   final String ClientProfile;
   final double MeetingTime;
   final String SelectCountry;
   final double Deadline;
   final String Keyword;
   final double MeetingPrior;

  Calendar(this.Uid, this.ClientName, this.UserName, this.ContactInfo, this.ClientProfile, this.MeetingTime, this.SelectCountry, this.Deadline, this.Keyword, this.MeetingPrior);

  // ignore: missing_return
   factory Calendar.fromFirestore(DocumentSnapshot doc){

     final firestore = FirebaseFirestore.instance.collection('New Client');
    Future getMeetingList() async {
      List itemsList = [];

      try {
        await firestore.get().then((querySnapshot) {
          querySnapshot.docs.forEach((element) {
            itemsList.add(element.data(

            ));
          });
        });

        return itemsList;
      } catch (e) {
        print(e.toString());
        return null;
      }
    }
    // var data = doc.data();
    // return Calendar(
    //     // Uid:
    //     // ClientName: data['uid'],
    //     // UserName,
    //     // ContactInfo,
    //     // ClientProfile,
    //     // MeetingTime,
    //     // SelectCountry,
    //     // Deadline,
    //     // Keyword,
    //     // MeetingPrior
    // );
  }

}