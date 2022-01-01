// ignore_for_file: prefer_const_constructors

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
          padding: const EdgeInsets.all(10),
          children: [
            Row(
              children: [
                SizedBox(width: 10),
                Icon(Icons.call, size: 40),
                SizedBox(width: 10),
                h6Text(context, 'Call Us'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(width: 60),
                bodyText1WithoutPadding(context, '01672-278528'),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                SizedBox(width: 60),
                bodyText1WithoutPadding(context, '01672-278529'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 10),
                Icon(Icons.email, size: 40),
                SizedBox(width: 10),
                h6Text(context, 'Email Us'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 60),
                bodyText1WithoutPadding(context, 'info@bgiet.ac.in'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 10),
                Icon(Icons.location_pin, size: 40),
                SizedBox(width: 10),
                h6Text(context, 'Address'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 60),
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
