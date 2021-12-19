import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addEnquiry({
    required String name,
    required String phoneNumber,
    required String email,
    required String message,
    required String deviceName,
  }) async {
    _firestore.collection('enquiries').add(
      {
        'name': name,
        'phoneNumber': phoneNumber,
        'email': email,
        'message': message,
        'deviceName': deviceName,
      },
    );
  }
}
