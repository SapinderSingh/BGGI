import 'package:bgiet/helpers/common_functions.dart';
import 'package:bgiet/helpers/common_widget_functions.dart';
import 'package:bgiet/models/batch_model.dart';
import 'package:bgiet/models/course_model.dart';
import 'package:bgiet/models/department_model.dart';
import 'package:bgiet/models/semester_model.dart';
import 'package:bgiet/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SyllabusScreen extends StatefulWidget {
  const SyllabusScreen({Key? key}) : super(key: key);

  @override
  State<SyllabusScreen> createState() => _SyllabusScreenState();
}

class _SyllabusScreenState extends State<SyllabusScreen> {
  final TextEditingController _departmentController = TextEditingController(),
      _courseController = TextEditingController(),
      _batchController = TextEditingController(),
      _semesterController = TextEditingController();

  String? _selectedCourseTitle,
      _selectedBatchTitle,
      _selectedSemesterTitle,
      _selectedDepartmentTitle,
      _courseId,
      _batchId,
      _courseSyllabusUrl,
      _departmentId;

  bool _isCourseSelected = false,
      _isBatchSelected = false,
      _isSemesterSelected = false,
      _isDepartmentSelected = false;

  final Batch _batch = Batch();

  final Semester _semester = Semester();

  Padding _readOnlyTextField({
    bool? isEnabled,
    required TextEditingController controller,
    void Function()? onTap,
    required String hintText,
  }) =>
      Padding(
        padding: dynamicPadding(context, padding: 16),
        child: TextField(
          enabled: isEnabled,
          autocorrect: false,
          autofocus: false,
          readOnly: true,
          controller: controller,
          onTap: onTap,
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ),
      );

  @override
  void dispose() {
    _batchController.dispose();
    _courseController.dispose();
    _departmentController.dispose();
    _semesterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedDepartmentTitle == null) {
      _departmentController.text = '';
    } else {
      _departmentController.text = _selectedDepartmentTitle!;
    }
    if (_selectedCourseTitle == null) {
      _courseController.text = '';
    } else {
      _courseController.text = _selectedCourseTitle!;
    }
    if (_selectedBatchTitle == null) {
      _batchController.text = '';
    } else {
      _batchController.text = _selectedBatchTitle!;
    }
    if (_selectedSemesterTitle == null) {
      _semesterController.text = '';
    } else {
      _semesterController.text = _selectedSemesterTitle!;
    }
    return Scaffold(
      appBar: customAppBar(context, title: 'Syllabus'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _readOnlyTextField(
            controller: _departmentController,
            onTap: () => _openDepartmentSelectionDialog(context),
            hintText: 'Select Department',
          ),
          _readOnlyTextField(
            isEnabled: _isDepartmentSelected,
            controller: _courseController,
            onTap: () => _openCourseSelectionDialog(context),
            hintText: 'Select Course',
          ),
          _readOnlyTextField(
            isEnabled: _isCourseSelected,
            controller: _batchController,
            onTap: () => _openBatchSelectionDialog(context),
            hintText: 'Select Batch',
          ),
          _readOnlyTextField(
            isEnabled: _isBatchSelected,
            controller: _semesterController,
            onTap: () => _openSemesterSelectionDialog(context),
            hintText: 'Select Semester',
          ),
          ElevatedButton(
            onPressed: _isDepartmentSelected &&
                    _isCourseSelected &&
                    _isBatchSelected &&
                    _isSemesterSelected
                ? () => showDialog(
                      context: context,
                      builder: (ctx) => CustomAlertDialog(
                        onPressed: () {
                          CommonFunctions.launchURL(_courseSyllabusUrl!, ctx);
                          Navigator.of(context).pop();
                        },
                      ),
                    )
                : null,
            child: const Text('Download PDF'),
          ),
        ],
      ),
    );
  }

  void _openDepartmentSelectionDialog(
    BuildContext ctx,
  ) {
    final List<Department> _listOfDepartments =
        Provider.of<Department>(ctx, listen: false).listOfDepartments;
    showDialog(
      context: ctx,
      builder: (_) => SimpleDialog(
        children: [
          if (_listOfDepartments.isEmpty)
            Column(
              children: [
                dynamicHeightSizedBox(context, height: 15),
                bodyText2(context, 'No Departments Added'),
                dynamicHeightSizedBox(context, height: 15),
              ],
            )
          else
            Column(
              children: List.generate(
                _listOfDepartments.length,
                (index) => RadioListTile<String>(
                  title: bodyText2(context, _listOfDepartments[index].title!),
                  value: _listOfDepartments[index].title!,
                  toggleable: true,
                  groupValue: _selectedDepartmentTitle,
                  onChanged: (String? value) async {
                    if (value == null) {
                      setState(() {
                        _selectedDepartmentTitle = value;
                        _selectedCourseTitle = value;
                        _selectedBatchTitle = value;
                        _selectedSemesterTitle = value;
                        _isDepartmentSelected = false;
                        _isCourseSelected = false;
                        _isBatchSelected = false;
                        _isSemesterSelected = false;
                      });
                    } else {
                      setState(
                        () {
                          _selectedDepartmentTitle = value;
                          _isDepartmentSelected = true;
                          _isCourseSelected = false;
                          _isBatchSelected = false;
                          _selectedCourseTitle = null;
                          _selectedBatchTitle = null;
                          _selectedSemesterTitle = null;
                        },
                      );
                      final Department _departmentByName =
                          _listOfDepartments.firstWhere(
                        (element) => element.title == _selectedDepartmentTitle,
                      );
                      _departmentId = _departmentByName.id;

                      await Provider.of<Course>(context, listen: false)
                          .fetchAndAddCoursesToList(
                        departmentId: _departmentId!,
                      );
                    }
                    Navigator.of(_).pop();
                  },
                ),
              ),
            ),
          _cancelButton(ctx),
        ],
      ),
    );
  }

  void _openCourseSelectionDialog(BuildContext ctx) {
    final List<Course> _listOfCourses =
        Provider.of<Course>(context, listen: false).listOfCourses;

    showDialog(
      context: ctx,
      builder: (_) => SimpleDialog(
        children: [
          if (_listOfCourses.isEmpty)
            Column(
              children: [
                dynamicHeightSizedBox(context, height: 15),
                bodyText2(context, 'No Courses Added'),
                dynamicHeightSizedBox(context, height: 15),
              ],
            )
          else
            Column(
              children: List.generate(
                _listOfCourses.length,
                (index) => RadioListTile<String>(
                  title: bodyText2(context, _listOfCourses[index].title!),
                  value: _listOfCourses[index].title!,
                  toggleable: true,
                  groupValue: _selectedCourseTitle,
                  onChanged: (String? value) async {
                    if (value == null) {
                      setState(() {
                        _selectedCourseTitle = value;
                        _selectedBatchTitle = value;
                        _selectedSemesterTitle = value;
                        _isCourseSelected = false;
                        _isBatchSelected = false;
                        _isSemesterSelected = false;
                      });
                    } else {
                      setState(
                        () {
                          _selectedCourseTitle = value;
                          _isCourseSelected = true;
                          _isBatchSelected = false;
                          _selectedBatchTitle = null;
                          _selectedSemesterTitle = null;
                          final Course _courseByName =
                              _listOfCourses.firstWhere(
                            (element) => element.title == _selectedCourseTitle,
                          );
                          _courseId = _courseByName.id;
                        },
                      );
                      await _batch.fetchAndAddBatchesToList(
                        departmentId: _departmentId!,
                        courseId: _courseId!,
                      );
                    }
                    Navigator.of(_).pop();
                  },
                ),
              ),
            ),
          _cancelButton(ctx),
        ],
      ),
    );
  }

  _openBatchSelectionDialog(BuildContext ctx) {
    final List<Batch> _listOfBatches = _batch.listOfBatches;

    showDialog(
      context: ctx,
      builder: (_) => SimpleDialog(
        children: [
          if (_listOfBatches.isEmpty)
            Column(
              children: [
                dynamicHeightSizedBox(context, height: 15),
                bodyText2(context, 'No Batches Added'),
                dynamicHeightSizedBox(context, height: 15),
              ],
            )
          else
            Column(
              children: List.generate(
                _listOfBatches.length,
                (index) => RadioListTile<String>(
                  title: bodyText2(context, _listOfBatches[index].title!),
                  value: _listOfBatches[index].title!,
                  toggleable: true,
                  groupValue: _selectedBatchTitle,
                  onChanged: (String? value) async {
                    if (value == null) {
                      setState(() {
                        _selectedBatchTitle = value;
                        _isBatchSelected = false;
                        _isSemesterSelected = false;
                        _selectedSemesterTitle = value;
                      });
                    } else {
                      setState(
                        () {
                          _selectedBatchTitle = value;
                          _isBatchSelected = true;
                          _isSemesterSelected = false;
                          _selectedSemesterTitle = null;
                          final Batch _batchByName = _listOfBatches.firstWhere(
                            (element) => element.title == _selectedBatchTitle,
                          );
                          _batchId = _batchByName.id;
                        },
                      );
                      await _semester.fetchAndAddSemestersToList(
                        departmentId: _departmentId!,
                        courseId: _courseId!,
                        batchId: _batchId!,
                      );
                    }
                    Navigator.of(_).pop();
                  },
                ),
              ),
            ),
          _cancelButton(ctx),
        ],
      ),
    );
  }

  _openSemesterSelectionDialog(BuildContext ctx) {
    final List<Semester> _listOfSemesters = _semester.listOfSemesters;

    showDialog(
      context: ctx,
      builder: (_) => SimpleDialog(
        children: [
          if (_listOfSemesters.isEmpty)
            Column(
              children: [
                dynamicHeightSizedBox(context, height: 15),
                bodyText2(context, 'No Semesters Added'),
                dynamicHeightSizedBox(context, height: 15),
              ],
            )
          else
            Column(
              children: List.generate(
                _listOfSemesters.length,
                (index) => RadioListTile<String>(
                  title: bodyText2(context, _listOfSemesters[index].title!),
                  value: _listOfSemesters[index].title!,
                  toggleable: true,
                  groupValue: _selectedSemesterTitle,
                  onChanged: (String? value) async {
                    if (value == null) {
                      setState(() {
                        _selectedSemesterTitle = value;
                        _isSemesterSelected = false;
                      });
                    } else {
                      setState(
                        () {
                          _isSemesterSelected = true;
                          _selectedSemesterTitle = value;
                          final Semester _semesterByName =
                              _listOfSemesters.firstWhere(
                            (element) =>
                                element.title == _selectedSemesterTitle,
                          );
                          _courseSyllabusUrl = _semesterByName.syllabusLink;
                        },
                      );
                    }
                    Navigator.of(_).pop();
                  },
                ),
              ),
            ),
          _cancelButton(ctx),
        ],
      ),
    );
  }

  Padding _cancelButton(BuildContext ctx) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: ElevatedButton(
          onPressed: () => Navigator.of(ctx).pop(),
          child: const Text('Cancel'),
        ),
      );
}
