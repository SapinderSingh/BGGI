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
    Download(
      name: "Fee Structure",
      url:
          "https://ptu.ac.in/wp-content/uploads/2020/10/Fee-Structure-of-AICTE-Courses-for-Session-2020-21.pdf",
    ),
    Download(
      name: "Eligibility",
      url:
          "https://ptu.ac.in/wp-content/uploads/2020/09/Eligibility-Criteria-2019-20-AICTE-Course-23-09-2019.pdf",
    ),
  ];
}
