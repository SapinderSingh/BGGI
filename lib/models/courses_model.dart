class Course {
  final String name, nickName;
  final String? syllabusLink;

  Course({
    required this.name,
    required this.nickName,
    required this.syllabusLink,
  });

  static final List<Course> _listOfCourses = [
    Course(
      name: 'B.Tech Electronics & Communication Engineering',
      nickName: 'B.Tech ECE',
      syllabusLink:
          'https://ptu.ac.in/wp-content/uploads/2021/08/New_Final_B.pdf',
    ),
    Course(
      name: 'B.Tech Computer Science and Engineering',
      nickName: 'B.Tech CSE',
      syllabusLink:
          'https://ptu.ac.in/wp-content/uploads/2021/05/SchemeSyllabus-B.techCSE2018-complete.pdf',
    ),
    Course(
      name: 'B.Tech Information Technology',
      nickName: 'B.Tech IT',
      syllabusLink:
          'https://ptu.ac.in/wp-content/uploads/2021/09/SChemeSyllabus-B_tech-IT-2018-update.pdf',
    ),
    Course(
      name: 'B.Tech Mechanical Engineering',
      nickName: 'B.Tech ME',
      syllabusLink:
          'https://ptu.ac.in/wp-content/uploads/2021/06/B-Tech-ME-3_8_Batch-2018_29062021.pdf',
    ),
    Course(
      name: '	B.Tech Electrical Engineering',
      nickName: 'B.Tech EE',
      syllabusLink:
          'https://ptu.ac.in/wp-content/uploads/2021/06/Electrical-Engineering-complete.pdf',
    ),
    Course(
      name: 'B.Tech Civil Engineering',
      nickName: 'B.Tech CE',
      syllabusLink:
          'https://ptu.ac.in/wp-content/uploads/2021/08/final-Btech-CE-3-8-affiliated-colleges.pdf',
    ),
    Course(
      name: 'B.Tech Food Technology',
      nickName: 'B.Tech FT',
      syllabusLink: 'https://ptu.ac.in/wp-content/uploads/2021/08/Full.pdf',
    ),
  ];

  static List<Course> get listOfCourses => [..._listOfCourses];
}
