import 'package:cloud_firestore/cloud_firestore.dart';

class CollegeNotice {
  final String? id, noticeUrl, noticeTitle, noticeDate;

  CollegeNotice({
    this.id,
    this.noticeUrl,
    this.noticeTitle,
    this.noticeDate,
  });

  Future<List<CollegeNotice>> fetchAndSetCollegeNotices() async {
    final List<CollegeNotice> _collegeNotices = [];

    CollectionReference _notices =
        FirebaseFirestore.instance.collection('college_notices');

    final QuerySnapshot<Object?> _noticesSnapshot =
        await _notices.orderBy('uploadDateTime').get();

    _noticesSnapshot.docs.toList().forEach(
      (_fetchedData) {
        final Map<String, dynamic> _convertedData =
            _fetchedData.data() as Map<String, dynamic>;
        _collegeNotices.add(
          CollegeNotice(
            id: _fetchedData.id,
            noticeDate: _convertedData['uploadDateTime'],
            noticeTitle: _convertedData['title'],
            noticeUrl: _convertedData['noticeDownloadUrl'],
          ),
        );
      },
    );
    return _collegeNotices;
  }
}
