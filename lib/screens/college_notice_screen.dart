import 'package:bgiet/helpers/common_widget_functions.dart';
import 'package:bgiet/helpers/constants.dart';
import 'package:bgiet/models/college_notice_model.dart';
import 'package:bgiet/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CollegeNoticeScreen extends StatelessWidget {
  const CollegeNoticeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'College Notices'),
      body: FutureBuilder<List<CollegeNotice>>(
        future: CollegeNotice().fetchAndSetCollegeNotices(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            final List<CollegeNotice> _collegeNotices = snapshot.data!;

            return ListView.separated(
              separatorBuilder: (_, __) => const Divider(),
              itemCount: _collegeNotices.length,
              itemBuilder: (ctx, index) {
                final _formattedDate = DateFormat.yMd().add_jm().format(
                      DateTime.parse(
                        _collegeNotices[index].noticeDate!,
                      ),
                    );
                return CustomListTile(
                  subtitle: 'Uploaded On: $_formattedDate',
                  title: _collegeNotices[index].noticeTitle!,
                  placeToGoTo: RouteConstants.viewPdfScreen,
                  isLink: false,
                  haveTrailingIcon: true,
                  toBeReplaced: false,
                  arguments: {
                    'pdfUrl': _collegeNotices[index].noticeUrl!,
                    'pdfName': _collegeNotices[index].noticeTitle!,
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
