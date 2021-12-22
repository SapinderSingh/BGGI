class AboutScreenData {
  final String? title, message, imageUrl, name;

  AboutScreenData({
    this.title,
    this.message,
    this.imageUrl,
    this.name,
  });

  static final List<AboutScreenData> _listOfAboutScreenData = [
    AboutScreenData(
        name: "Late S. HAKAM SINGH JAWANDHA",
        title: 'Founder\'s Desk',
        imageUrl: 'https://bgiet.ac.in/wp-content/uploads/2015/11/head.jpg',
        message: '''
The life of Late S. HAKAM SINGH JAWANDHA, FOUNDER CHAIRMAN, BGGI, was a saga of fortitude, conviction and sacrifice. He had a dream and the path to that dream was never easy, yet he labored hard never succumbing to difficulties. Realizing role of technical education in the emerging India, S. Hakam Singh Jawandha, a renowned advocate by profession and dynamic personality with far sighted vision, laid the foundation of Bhai Gurdas Technical Educational Trust. Under his able guidance and support, the trust ventured into the field of professional education with the establishment of Bhai Gurdas Institute of Management and Technology in 1999 and led to the formation of Bhai Gurdas Group of Institutions (BGGI)

Offering multitude of courses including B.Tech, M.Tech, MBA, M.Com, MCA, B.Com, BBA, BCA, B.Sc (Agriculture), M.Sc.(Physics, Chemistry, Math), Law, Education, Nursing, and Diploma in Engineering to thousands of students. The humble beginning soon emerged into a huge and vibrant educational campus situated on the Chandigarh-Bhatinda National Highway. Spreads over an area of 45 acres in the serene environs, having sprawling lush green lawns, has now developed into an abode of quality education—where the vision meets action leading to achievements par excellence.

Over the period of just one decade, BGGI has established a chain of institutions which include Bhai Gurdas Institute of Management and Technology (1999), Bhai Gurdas Institute of Engineering and Technology (2002), Bhai Gurdas College of Law (2003) and Bhai Gurdas Polytechnic College (2004) Bhai Gurdas Institute of Nursing(2011), Bhai Gurdas Institute ofEducation(2015) and Bhai Gurdas Degree College(2015). By establishing these colleges, Sardar HS Jawandha brought Sangrur not only on the educational map of India but to international level also.
      '''),
    AboutScreenData(
        name: "Dr. Guninderjit Singh Jawandha",
        title: 'Chairman\'s Desk',
        imageUrl:
            'https://bhaigurdas.org/wp-content/uploads/2017/03/guninder.jpg',
        message: '''
Bhai Gurdas Group of institutions is one of the foremost educational groups in North India. We deem that creating an academic foundation for societal, educational, scientific, economic and technological development in our Nation can establish into Global perspectives. We endeavour at establishing bench marks in academic excellence and holistic grooming to assist our students to meet the career challenges in the increasingly globalised economic conditions. Thus, BGGI has earned goodwill by our students and society at large.

BGGI is dedicated to foster in its students, the pursuits of individual fineness and participate in full range of scholastic, spiritual, cultural, social and physical activities, and to make them evolve as all-rounder. Education is the basis for all future possibilities in the life of a student. Also, quality education is a passport to its steep rise in life and creates practical avenues to attain financial gains. It provides golden opportunities to lead a life of decorum & affluence. To attain this objective, trainings in placement, personality development, communication skills and other soft skills are provided by expert members.

Our team of committed and highly qualified faculty strives to broaden the students' horizon of learning, thereby helping every student to experience success with high grades. We take exceptional care that our ideas are not merely discussed but executed. The placement scenario is also quite laudable as several premier companies visit our campus for recruitment. We never compromise on any part of our quality and our policy of providing technical education in international standards.

I am extremely pleased to welcome you all to being a part of our BGGI family. I pray to the Almighty to bless you with a great future. I assure you that the institute will provide you the apt launching pad to fly high motivated by great leadership and inspiring faculty me.
      '''),
    AboutScreenData(
        name: "DR. SUVREET KAUR JAWANDHA",
        title: 'Dean\'s Desk',
        imageUrl:
            'https://bhaigurdas.org/wp-content/uploads/2017/04/SUVREET.jpg',
        message: '''
Education brings an advancement of humankind. At Bhai Gurdas Group of Institutions, we educate students to be problem solvers, project leaders, communicators, and ethical citizens of a global community. Academic excellence has always been the hallmark of BGGI and we are committed to provide a comprehensive education that seeks to develop the students into academically proficient morally upright and socially well integrated individuals. We offer the congenial atmosphere coupled with the intellectual and technological resources of a world-class research institution.

We also open up new vistas of career opportunities for our students through associations with various international universities. It is with a dint of sheer hard work, tremendous growth and laudable achievements; BGGI has emerged as an epitome of learning and is setting benchmarks for others to follow. The service of the institution in creating personally mature, professionally equipped and service-oriented graduates is really worth mentioning. We strongly believe in academic excellence and do not compromise on teaching standards or discipline. These three things are the springboards on which we operate.

I invite you to browse our Website and App to learn more about our engineering, management, diploma, law and nursing programs. I hope you will feel inspired by the accomplishments of our faculty and students and the work and activities in which they are engaged with current and potential impact.
          '''),
  ];

  static List<AboutScreenData> get listOfAboutScreenData =>
      [..._listOfAboutScreenData];
}
