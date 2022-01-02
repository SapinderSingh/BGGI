import 'package:bgiet/helpers/common_widget_functions.dart';
import 'package:bgiet/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: customAppBar(context, title: 'Contact Us'),
      body: pressBackAgainToClose(
        child: ListView(
          padding: dynamicPadding(context, padding: 10),
          children: [
            Row(
              children: [
                dynamicWidthSizedBox(context, width: 10),
                const Icon(Icons.call, size: 40),
                dynamicWidthSizedBox(context, width: 10),
                h6Text(context, 'Call Us'),
              ],
            ),
            dynamicHeightSizedBox(context, height: 10),
            Row(
              children: [
                dynamicWidthSizedBox(context, width: 60),
                bodyText1WithoutPadding(context, '01672-278528'),
              ],
            ),
            dynamicHeightSizedBox(context, height: 5),
            Row(
              children: [
                dynamicWidthSizedBox(context, width: 60),
                bodyText1WithoutPadding(context, '01672-278529'),
              ],
            ),
            dynamicHeightSizedBox(context, height: 20),
            Row(
              children: [
                dynamicWidthSizedBox(context, width: 10),
                const Icon(Icons.email, size: 40),
                dynamicWidthSizedBox(context, width: 10),
                h6Text(context, 'Email Us'),
              ],
            ),
            dynamicHeightSizedBox(context, height: 10),
            Row(
              children: [
                dynamicWidthSizedBox(context, width: 60),
                bodyText1WithoutPadding(context, 'info@bgiet.ac.in'),
              ],
            ),
            dynamicHeightSizedBox(context, height: 20),
            Row(
              children: [
                dynamicWidthSizedBox(context, width: 10),
                const Icon(Icons.location_pin, size: 40),
                dynamicWidthSizedBox(context, width: 10),
                h6Text(context, 'Address'),
              ],
            ),
            dynamicHeightSizedBox(context, height: 10),
            Row(
              children: [
                dynamicWidthSizedBox(context, width: 60),
                Expanded(
                  child: bodyText1WithoutPadding(
                    context,
                    'BHAI GURDAS INSTITUTE OF ENGINEERING & TECHNOLOGY Main Patiala Road, NH-7, Sangrur, Pin 148001 Punjab (INDIA)',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
