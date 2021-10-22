class Course {
  final String name;
  final String? syllabusLink;

  Course({
    required this.name,
    required this.syllabusLink,
  });

  static final List<Course> _listOfCourses = [
    Course(
      name: 'B.Tech [Electronics & Communication Engineering]',
      syllabusLink:
          'https://ptu.ac.in/wp-content/uploads/2021/08/New_Final_B.pdf',
    ),
    Course(
      name: 'B.Tech [Computer Science and Engineering]',
      syllabusLink:
          'https://ptu.ac.in/wp-content/uploads/2021/05/SchemeSyllabus-B.techCSE2018-complete.pdf',
    ),
    Course(
      name: 'B.Tech [Information Technology]',
      syllabusLink:
          'https://ptu.ac.in/wp-content/uploads/2021/09/SChemeSyllabus-B_tech-IT-2018-update.pdf',
    ),
  ];

  static List<Course> get listOfCourses => [..._listOfCourses];
}
