import 'package:bgiet/helpers/common_functions.dart';
import 'package:bgiet/models/branch_model.dart';
import 'package:bgiet/models/courses_model.dart';
import 'package:bgiet/models/department_model.dart';
import 'package:bgiet/widgets/custom_alert_dialog.dart';
import 'package:bgiet/widgets/custom_app_bar.dart';
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
      _branchController = TextEditingController();

  String? _selectedCourseTitle,
      _selectedBranchTitle,
      _selectedDepartmentTitle,
      _courseId,
      _branchSyllabusUrl,
      _departmentId;

  bool _isCourseSelected = false,
      _isBranchSelected = false,
      _isDepartmentSelected = false;

  Padding _readOnlyTextField({
    bool? isEnabled,
    required TextEditingController controller,
    void Function()? onTap,
    required String hintText,
  }) =>
      Padding(
        padding: const EdgeInsets.all(16.0),
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
    _branchController.dispose();
    _courseController.dispose();
    _departmentController.dispose();
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
    if (_selectedBranchTitle == null) {
      _branchController.text = '';
    } else {
      _branchController.text = _selectedBranchTitle!;
    }
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'Syllabus',
      ),
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
            controller: _branchController,
            onTap: () => _openBranchSelectionDialog(context),
            hintText: 'Select Branch',
          ),
          ElevatedButton(
            onPressed: _isDepartmentSelected &&
                    _isCourseSelected &&
                    _isBranchSelected
                ? () => showDialog(
                      context: context,
                      builder: (ctx) => CustomAlertDialog(
                        onPressed: () {
                          CommonFunctions.launchURL(_branchSyllabusUrl!, ctx);
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
                SizedBox(
                  height: 15,
                ),
                Text('No Departments Added'),
                SizedBox(
                  height: 15,
                ),
              ],
            )
          else
            Column(
              children: List.generate(
                _listOfDepartments.length,
                (index) => RadioListTile<String>(
                  title: Text(_listOfDepartments[index].title!),
                  value: _listOfDepartments[index].title!,
                  toggleable: true,
                  groupValue: _selectedDepartmentTitle,
                  onChanged: (String? value) async {
                    if (value == null) {
                      setState(() {
                        _selectedDepartmentTitle = value;
                        _isDepartmentSelected = false;
                      });
                    } else {
                      setState(
                        () {
                          _selectedDepartmentTitle = value;
                          _isDepartmentSelected = true;
                          _isCourseSelected = false;
                          _isBranchSelected = false;
                          _selectedCourseTitle = null;
                          _selectedBranchTitle = null;
                        },
                      );
                      final Department _departmentByName =
                          _listOfDepartments.firstWhere(
                        (element) => element.title == _selectedDepartmentTitle,
                      );
                      _departmentId = _departmentByName.id;

                      await Provider.of<Course>(context, listen: false)
                          .fetchAndAddCoursesToList(
                              departmentId: _departmentId!);
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
              children: const [
                SizedBox(
                  height: 15,
                ),
                Text('No Courses Added'),
                SizedBox(
                  height: 15,
                ),
              ],
            )
          else
            Column(
              children: List.generate(
                _listOfCourses.length,
                (index) => RadioListTile<String>(
                  title: Text(_listOfCourses[index].title!),
                  value: _listOfCourses[index].title!,
                  toggleable: true,
                  groupValue: _selectedCourseTitle,
                  onChanged: (String? value) async {
                    if (value == null) {
                      setState(() {
                        _selectedCourseTitle = value;
                        _isCourseSelected = false;
                      });
                    } else {
                      setState(
                        () {
                          _selectedCourseTitle = value;
                          _isCourseSelected = true;
                          _isBranchSelected = false;
                          _selectedBranchTitle = null;
                          final Course _courseByName =
                              _listOfCourses.firstWhere(
                            (element) => element.title == _selectedCourseTitle,
                          );
                          _courseId = _courseByName.id;
                        },
                      );
                      await Provider.of<Branch>(context, listen: false)
                          .fetchAndAddBranchesToList(
                        courseId: _courseId!,
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

  void _openBranchSelectionDialog(BuildContext ctx) {
    final List<Branch> _listOfBranches =
        Provider.of<Branch>(context, listen: false).listOfBranches;
    final List<Branch> _requiredBranchList = _listOfBranches
        .where((element) => element.courseId == _courseId)
        .toList();
    showDialog(
      context: ctx,
      builder: (_) => SimpleDialog(
        children: [
          if (_requiredBranchList.isEmpty)
            Column(
              children: const [
                SizedBox(
                  height: 15,
                ),
                Text('No Branches Added'),
                SizedBox(
                  height: 15,
                ),
              ],
            )
          else
            Column(
              children: List.generate(
                _requiredBranchList.length,
                (index) => RadioListTile<String>(
                  title: Text(_requiredBranchList[index].title!),
                  value: _requiredBranchList[index].title!,
                  toggleable: true,
                  groupValue: _selectedBranchTitle,
                  onChanged: (String? value) {
                    if (value == null) {
                      setState(() {
                        _selectedBranchTitle = value;
                        _isBranchSelected = false;
                      });
                    } else {
                      _selectedBranchTitle = value;

                      final _selectedBranch = _requiredBranchList.firstWhere(
                        (element) => element.title == _selectedBranchTitle,
                      );
                      setState(
                        () {
                          _isBranchSelected = true;
                          _branchSyllabusUrl = _selectedBranch.syllabusLink;
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

  _cancelButton(BuildContext ctx) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: ElevatedButton(
          onPressed: () => Navigator.of(ctx).pop(),
          child: const Text(
            'Cancel',
          ),
        ),
      );
}
