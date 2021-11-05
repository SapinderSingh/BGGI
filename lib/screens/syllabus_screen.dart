import 'package:bgiet/models/courses_model.dart';
import 'package:bgiet/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SyllabusScreen extends StatefulWidget {
  const SyllabusScreen({Key? key}) : super(key: key);

  @override
  State<SyllabusScreen> createState() => _SyllabusScreenState();
}

class _SyllabusScreenState extends State<SyllabusScreen> {
  final List<Course> _listOfCourses = Course.listOfCourses;
  String? _selectedValue;
  String _courseSyllabusUrl = '';

  final TextEditingController _syllabusTextController = TextEditingController();

  @override
  void dispose() {
    _syllabusTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedValue == null) {
      _syllabusTextController.text = '';
    } else {
      _syllabusTextController.text = _selectedValue!;
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              autocorrect: false,
              autofocus: false,
              readOnly: true,
              controller: _syllabusTextController,
              onTap: () => _openSelectionDialog(context),
              decoration: const InputDecoration(
                hintText: 'Select Course',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => _launchURL(_courseSyllabusUrl),
            child: const Text('Download PDF'),
          ),
        ],
      ),
    );
  }

  void _openSelectionDialog(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (_) => SimpleDialog(
        children: [
          Column(
            children: List.generate(
              _listOfCourses.length,
              (index) => RadioListTile<String>(
                title: Text(_listOfCourses[index].name),
                value: _listOfCourses[index].name,
                toggleable: true,
                groupValue: _selectedValue,
                onChanged: (String? value) {
                  if (value == null) {
                    setState(() {
                      _selectedValue = value;
                    });
                  } else {
                    setState(() {
                      _selectedValue = value;
                    });
                    final Course _courseByName = _listOfCourses.firstWhere(
                      (element) => element.name == _selectedValue,
                    );
                    _courseSyllabusUrl = _courseByName.syllabusLink!;
                  }
                  Navigator.of(_).pop();
                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(_).pop(),
            child: const Text(
              'Cancel',
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    // TODO: Error handling
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }
}
