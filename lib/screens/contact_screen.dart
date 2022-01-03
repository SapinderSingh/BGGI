import 'package:bgiet/helpers/common_functions.dart';
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
            dynamicHeightSizedBox(context, height: 5),
            Row(
              children: [
                dynamicWidthSizedBox(context, width: 60),
                bodyText1WithoutPadding(context, '01672-251208'),
              ],
            ),
            dynamicHeightSizedBox(context, height: 5),
            Row(
              children: [
                dynamicWidthSizedBox(context, width: 60),
                bodyText1WithoutPadding(context, '01672-223012'),
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
                bodyText1WithoutPadding(context, 'bggi.admission@gmail.com'),
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
                    'Bhai Gurdas Group of Institutions, Main Patiala Road, NH-7, Sangrur, Pin 148001 Punjab (INDIA)',
                  ),
                ),
              ],
            ),
            dynamicHeightSizedBox(context, height: 20),
            Row(
              children: [
                dynamicWidthSizedBox(context, width: 10),
                const Icon(Icons.web, size: 40),
                dynamicWidthSizedBox(context, width: 10),
                h6Text(context, 'Our Websites'),
              ],
            ),
            Row(
              children: [
                _textButton(
                  context,
                  title: 'bhaigurdas.org',
                  url: 'https://bhaigurdas.org/',
                ),
                _textButton(
                  context,
                  title: 'bgiet.ac.in',
                  url: 'https://bgiet.ac.in/',
                ),
              ],
            ),
            Row(
              children: [
                _textButton(
                  context,
                  title: 'bgie.co.in',
                  url: 'https://bgie.co.in/',
                ),
                _textButton(
                  context,
                  title: 'bgdc.in',
                  url: 'https://bgdc.in/',
                ),
              ],
            ),
            Row(
              children: [
                _textButton(
                  context,
                  title: 'bgin.co.in',
                  url: 'https://bgin.co.in/',
                ),
                _textButton(
                  context,
                  title: 'bgpc.co.in',
                  url: 'https://bgpc.co.in/',
                ),
              ],
            ),
            Row(
              children: [
                _textButton(
                  context,
                  title: 'bgimt.ac.in',
                  url: 'https://bgimt.ac.in/',
                ),
                _textButton(
                  context,
                  title: 'bgcl.net.in',
                  url: 'https://bgcl.net.in/',
                ),
              ],
            ),
            _textButton(
              context,
              title: 'bhaigurdas.org/bgias',
              url:
                  'https://bhaigurdas.org/bhai-gurdas-institute-of-allied-sciences/#',
            ),
            SizedBox(height: 20),
            Row(
              children: [
                dynamicWidthSizedBox(context, width: 10),
                const Icon(Icons.web_asset, size: 40),
                dynamicWidthSizedBox(context, width: 10),
                h6Text(context, 'Social Media'),
              ],
            ),
            dynamicHeightSizedBox(context, height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => CommonFunctions.launchURL(
                    'https://www.facebook.com/BhaiGurdasGroup/',
                    context,
                  ),
                  child: Image.asset(
                    'assets/images/social_media/fb_icon.png',
                    height: 40,
                    width: 40,
                  ),
                ),
                SizedBox(width: 20),
                InkWell(
                  onTap: () => CommonFunctions.launchURL(
                    'https://www.instagram.com/bhaigurdasgroup/?hl=en',
                    context,
                  ),
                  child: Image.asset(
                    'assets/images/social_media/insta_icon.png',
                    height: 40,
                    width: 40,
                  ),
                ),
                SizedBox(width: 20),
                InkWell(
                  onTap: () => CommonFunctions.launchURL(
                    'https://twitter.com/gurdas_of',
                    context,
                  ),
                  child: Image.asset(
                    'assets/images/social_media/twitter_icon.png',
                    height: 40,
                    width: 40,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _textButton(
    BuildContext context, {
    required String title,
    required String url,
  }) =>
      TextButton(
        onPressed: () => CommonFunctions.launchURL(url, context),
        child: SizedBox(
          width: (MediaQuery.of(context).size.width / 2) - 30,
          child: Text(
            title,
            textAlign: TextAlign.center,
          ),
        ),
      );
}
