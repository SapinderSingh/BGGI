import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Department with ChangeNotifier {
  String? title, id;

  Department({
    this.title,
    this.id,
  });

  final List<Department> _listOfDepartments = [];

  List<Department> get listOfDepartments => [..._listOfDepartments];

  Future<void> fetchAndAddDepartmentsToList() async {
    CollectionReference _departments =
        FirebaseFirestore.instance.collection('departments');
    final QuerySnapshot<Object?> _coursesSnapshot =
        await _departments.orderBy('title').get();
    _listOfDepartments.clear();

    _coursesSnapshot.docs.toList().forEach(
      (QueryDocumentSnapshot<Object?> _fetchedData) async {
        final Map<String, dynamic> _convertedData =
            _fetchedData.data() as Map<String, dynamic>;

        _listOfDepartments.add(
          Department(
            title: _convertedData['title'],
            id: _fetchedData.id,
          ),
        );
      },
    );
  }
}
