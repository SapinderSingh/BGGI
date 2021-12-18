import 'package:cloud_firestore/cloud_firestore.dart';

class OurRecruiterModel {
  final String? id, title, imageUrl;

  OurRecruiterModel({this.id, this.imageUrl, this.title});

  static Future<List<OurRecruiterModel>> fetchAndAddRecruitersToList() async {
    final List<OurRecruiterModel> _ourRecruiters = [];

    CollectionReference _departments =
        FirebaseFirestore.instance.collection('our_recruiters');
    final QuerySnapshot<Object?> _recruitersSnapshot =
        await _departments.orderBy('recruiter_name').get();

    _recruitersSnapshot.docs.toList().forEach(
      (QueryDocumentSnapshot<Object?> _fetchedData) async {
        final Map<String, dynamic> _convertedData =
            _fetchedData.data() as Map<String, dynamic>;

        _ourRecruiters.add(
          OurRecruiterModel(
            imageUrl: _convertedData['recruiter_image_url'],
            title: _convertedData['recruiter_name'],
            id: _fetchedData.id,
          ),
        );
      },
    );
    return _ourRecruiters;
  }
}
