import 'package:cloud_firestore/cloud_firestore.dart';

class Batch {
  final String? title, id;

  Batch({
    this.title,
    this.id,
  });

  final List<Batch> _listOfBatches = [];

  List<Batch> get listOfBatches => [..._listOfBatches];

  Future<void> fetchAndAddBatchesToList({
    required String departmentId,
    required String courseId,
  }) async {
    CollectionReference _batches = FirebaseFirestore.instance.collection(
      'departments/$departmentId/courses/$courseId/batches',
    );

    final QuerySnapshot<Object?> _batchesSnapshot =
        await _batches.orderBy('title').get();

    _listOfBatches.clear();

    _batchesSnapshot.docs.toList().forEach(
      (_fetchedData) {
        final Map<String, dynamic> _convertedData =
            _fetchedData.data() as Map<String, dynamic>;
        _listOfBatches.add(
          Batch(
            id: _fetchedData.id,
            title: _convertedData['title'],
          ),
        );
      },
    );
  }
}
