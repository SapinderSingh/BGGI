import 'package:bgiet/helpers/common_functions.dart';
import 'package:bgiet/helpers/common_widget_functions.dart';
import 'package:flutter/material.dart';

class FacilitiesScreen extends StatelessWidget {
  const FacilitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Facilities'),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [
          _FacilityWidget(
            title: 'WI-FI CAMPUS',
            description:
                'The campus of BGGI is Wi-Fi enabled. The students can access the Internet round the clock with High Speed Internet Connectivity of 12 Mbps to enhance their knowledge as well as extract e-Information from any location on the campus, including classrooms and hostels.',
            imageUrl:
                'https://bgiet.ac.in/wp-content/uploads/2017/05/wifi-300x215.jpg',
          ),
          _FacilityWidget(
            title: 'BANKING',
            description:
                'BGGI has a branch of PNB that lends a hand to the students in money transactions, withdrawing and depositing. It also offers educational loans to the students.',
            imageUrl: 'https://bgiet.ac.in/wp-content/uploads/2017/05/bank.jpg',
          ),
          _FacilityWidget(
            title: 'GYMNASIUM',
            description:
                'BGGI has a gymnasium stocked with all the modern equipments where the students work out for keeping themselves hale and hearty.',
            imageUrl: 'https://bgiet.ac.in/wp-content/uploads/2017/05/gym.jpg',
          ),
          _FacilityWidget(
            title: 'CANTEEN',
            description:
                'BGIET cafeteria is well maintained and fully endowed to meet the culinary needs of the students, It offers refuge to the students weary of their strenuous and hectic academic schedule.',
            imageUrl:
                'https://bgiet.ac.in/wp-content/uploads/2017/05/cafeteria.jpg',
          ),
          _FacilityWidget(
            description:
                "The Institute has its own Health Centre to provide necessary medical aid to the students and stoff in the campus. To ensure the safety of the students and to minimize the risk involved, proper medical amenities with first-aid are alsa provided in lobs and workshops of all the concerned departments, hostels (boys and girls).",
            imageUrl:
                'https://bgiet.ac.in/wp-content/uploads/2017/05/dispensary.jpg',
            title: 'DISPENSARY',
          ),
          _FacilityWidget(
            description:
                "A hygienic and spacious canteen is there to meet the culinary needs of students which offers a variety of eatables. To cater to the basic needs of the students the campus has a shopping complex with a Stationery Shop & General Store, Cafeteria, Barber Shop, Laundry Shop & photostat Shop, Juice Shop, Milk Corner, Fax & STD facilities.",
            imageUrl:
                'https://bgiet.ac.in/wp-content/uploads/2017/05/shopping.jpg',
            title: 'SHOPPING ARCADE',
          ),
          _FacilityWidget(
            description:
                'Transport facility is provided by the institute to the student & staff. The Institute runs total of 50 buses throughout the Patiala, Samana, Nabha, Ahmadgarh, Malerkotla, Amargarh, Dhuri, Sherpur, Sindhorh, Kathala, Basaur, Barnala, Tapa, Dhanaula, MehalKalan, KattuBalian, Sunam, Chathe (Sunam), Longowal, LehraGaga, Moonak, Patran, Khanauri, Dirba, Bareta, Budhlada, Mawi Kalan (Samana), Bhawanigarh & also to the Sangrur. For this facility the nominal charge is paid by the students.',
            imageUrl:
                'https://bgiet.ac.in/wp-content/uploads/2017/05/transportation.jpg',
            title: 'TRANSPORTATION',
          ),
        ],
      ),
    );
  }
}

class _FacilityWidget extends StatelessWidget {
  const _FacilityWidget({
    Key? key,
    required this.description,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  final String title, imageUrl, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        h4Text(context, title),
        const SizedBox(
          height: 10,
        ),
        CommonFunctions().loadImageFromNetwork(imageUrl),
        bodyText1(description, context),
      ],
    );
  }
}
