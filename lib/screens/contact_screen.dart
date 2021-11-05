// ignore_for_file: prefer_const_constructors

import 'package:bgiet/widgets/custom_app_bar.dart';
import 'package:bgiet/widgets/main_drawer.dart';
import 'package:bgiet/widgets/press_back_again_to_close.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: customAppBar(
        context: context,
        title: 'Contact Us',
      ),
      body: pressBackAgainToClose(
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 10),
                  Icon(
                    Icons.call,
                    size: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Call Us',
                    style: Theme.of(context).primaryTextTheme.headline6,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 60,
                  ),
                  Text(
                    '01672-278528',
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 60,
                  ),
                  Text(
                    '01672-278529',
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(width: 10),
                  Icon(
                    Icons.email,
                    size: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Email Us',
                    style: Theme.of(context).primaryTextTheme.headline6,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 60,
                  ),
                  Text(
                    'info@bgiet.ac.in',
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(width: 10),
                  Icon(
                    Icons.location_pin,
                    size: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Address',
                    style: Theme.of(context).primaryTextTheme.headline6,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 60,
                  ),
                  Expanded(
                    child: Text(
                      'BHAI GURDAS INSTITUTE OF ENGINEERING & TECHNOLOGY Main Patiala Road, NH-7, Sangrur, Pin 148001 Punjab (INDIA)',
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
