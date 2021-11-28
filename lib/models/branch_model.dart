import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Branch with ChangeNotifier {
  final String? description,
      imageLink,
      nickname,
      syllabusLink,
      branchId,
      title,
      courseId,
      courseDuration;

  Branch({
    this.branchId,
    this.courseId,
    this.title,
    this.description,
    this.imageLink,
    this.nickname,
    this.syllabusLink,
    this.courseDuration,
  });

  final List<Branch> _listOfBranches = [];

  List<Branch> get listOfBranches => [..._listOfBranches];

  Future<void> fetchAndAddBranchesToList(
      {required String courseId, required String departmentId}) async {
    CollectionReference _branches = FirebaseFirestore.instance.collection(
      'departments/$departmentId/courses/$courseId/branches',
    );

    final QuerySnapshot<Object?> _branchesSnapshot = await _branches.get();

    _listOfBranches.clear();

    _branchesSnapshot.docs.toList().forEach(
      (_fetchedData) {
        final Map<String, dynamic> _convertedData =
            _fetchedData.data() as Map<String, dynamic>;
        _listOfBranches.add(
          Branch(
            courseDuration: _convertedData['courseDuration'],
            courseId: courseId,
            title: _convertedData['title'],
            branchId: _fetchedData.id,
            description: _convertedData['description'],
            imageLink: _convertedData['imageLink'],
            nickname: _convertedData['nickname'],
            syllabusLink: _convertedData['syllabusLink'],
          ),
        );
      },
    );
  }
}
