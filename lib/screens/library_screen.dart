import 'package:bgiet/helpers/common_functions.dart';
import 'package:bgiet/helpers/common_widget_functions.dart';
import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CommonFunctions _commonFunction = CommonFunctions();
    return Scaffold(
      appBar: customAppBar(context, title: 'Library'),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Image.asset(
            'assets/images/lib1.jpg',
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
          const SizedBox(height: 20),
          _commonFunction.loadImageFromNetwork(
            'https://bgiet.ac.in/wp-content/uploads/2017/05/lib2-300x200.jpg',
          ),
          const SizedBox(height: 20),
          Text(
            '''
The air conditioned central library is an example of excellence as regard to library services and collection. This fully computerized Wi-Fi library has on its shelves more than 67,000 volumes which include a comprehensive array of Engineering, Management, and Polytechnic in print format. It has membership of DELNET and subscription of Info Tract packages in electronic formats. Library also holds about 500 E-books collection that is available on web. The Library subscribes to about 200 current periodicals on different subjects. It also holds the back volumes of periodicals. Library also provides old question papers for the students.

The aesthetically designed three floored, was founded keeping in view the modern day education demands and it contains various sections viz. Circulation, Periodical, Reference, Reprographic and a separate e-journals lab for online journals and e-books. Library also has one conference hall at the top with 150 seating capacity. All the sections are under surveillance security system. Special seating arrangements have been made for students who want to study their personal books in the library. The timing of library is from 8:00 A.M to 8:00 P.M. which provide ample reading opportunities to day scholars as well as hostel students.

Whole collection and in-house operations are handled by highly qualified library staff. The team of Library staff consists of one Senior Librarian, Two Librarians, four Assistant Librarians, four Library Assistants and four Library Restorers. Library is fully automated by using bar code and NFC technique with the help of ERP software.
          ''',
            style: Theme.of(context).primaryTextTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
