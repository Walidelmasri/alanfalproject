import 'package:cloud_firestore/cloud_firestore.dart';

class EnquiryServices{
  String collection = "enquiry";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createEnquiry({String name, String phonenumber, String enquiry, String id}) {
    _firestore.collection(collection).doc(id).set({
      "id": id,
      "createdAt": DateTime.now(),
      "enquiry": enquiry,
      "phonenumber": phonenumber,
      "name": name
    });
  }
}