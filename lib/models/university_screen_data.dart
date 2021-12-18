class UniversityScreenData {
  String? title, url, departmentName;

  UniversityScreenData({
    this.title,
    this.url,
    this.departmentName,
  });

  static final List<UniversityScreenData> _universityScreendatalist = [
    UniversityScreenData(
      title: 'PTU Exam',
      url: 'https://www.ptuexam.com',
      departmentName: 'Engineering, Management, Exams',
    ),
    UniversityScreenData(
      title: 'PTU.AC.IN',
      url: 'https://ptu.ac.in',
      departmentName: 'Engineering, Management',
    ),
    UniversityScreenData(
      title: 'MRSPTU.AC.IN',
      url: 'https://mrsptu.ac.in',
      departmentName: 'Allied Sciences',
    ),
    UniversityScreenData(
      title: 'Punjab Tech Ed',
      url: 'http://www.punjabteched.com',
      departmentName: 'Polytechnic',
    ),
    UniversityScreenData(
      title: 'BFUHS',
      url: 'https://www.bfuhs.ac.in',
      departmentName: 'Nursing',
    ),
    UniversityScreenData(
      title: 'Punjabi University',
      url: 'http://www.punjabiuniversity.ac.in',
      departmentName: 'Law',
    )
  ];

  static List<UniversityScreenData> get universityScreenDataList =>
      [..._universityScreendatalist];
}
