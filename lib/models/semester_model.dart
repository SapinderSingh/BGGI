import 'package:cloud_firestore/cloud_firestore.dart';

class Semester {
  final String? syllabusLink, title, id;

  Semester({
    this.id,
    this.title,
    this.syllabusLink,
  });

  final List<Semester> _listOfSemesters = [];

  List<Semester> get listOfSemesters => [..._listOfSemesters];

  Future<void> fetchAndAddSemestersToList({
    required String departmentId,
    required String courseId,
    required String batchId,
  }) async {
    CollectionReference _semesters = FirebaseFirestore.instance.collection(
      'departments/$departmentId/courses/$courseId/batches/$batchId/semesters',
    );

    final QuerySnapshot<Object?> _semetersSnapshot =
        await _semesters.orderBy('title').get();

    _listOfSemesters.clear();

    _semetersSnapshot.docs.toList().forEach(
      (_fetchedData) {
        final Map<String, dynamic> _convertedData =
            _fetchedData.data() as Map<String, dynamic>;
        _listOfSemesters.add(
          Semester(
            id: _fetchedData.id,
            title: _convertedData['title'],
            syllabusLink: _convertedData['syllabusLink'],
          ),
        );
      },
    );
  }
}
