class BgietColors {}

class RouteConstants {
  static const String aboutScreen = '/about-screen',
      downloadsScreen = '/downloads-screen',
      studentLifeScreen = '/student-life-screen',
      contactScreen = '/contact-screen',
      academicsScreen = '/academics-screen',
      coursesScreen = '/courses-screen',
      viewProfileScreen = '/view-profile-screen',
      syllabusScreen = '/syllabus-screen',
      facultyScreen = '/faculty-screen',
      settingsScreen = '/settings-screen',
      courseDescriptionScreen = 'course-description-screen',
      ptuExamWebView = '/ptu-exam-webview';
}

class Download {
  final String name, url;

  Download({
    required this.name,
    required this.url,
  });

  static List<Download> get getDownloads => [..._downloads];

  static final List<Download> _downloads = [
    Download(
      name: 'Admission Form',
      url: 'https://bgiet.ac.in/wp-content/uploads/2017/05/admission.pdf',
    ),
    Download(
      name: 'Leave Form',
      url: 'https://bgiet.ac.in/wp-content/uploads/2019/02/leave-1.pdf',
    ),
    Download(
      name: 'TA/DA Form',
      url: 'https://bgiet.ac.in/wp-content/uploads/2019/02/tada-1.pdf',
    ),
  ];
}
