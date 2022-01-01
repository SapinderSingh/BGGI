import 'package:bgiet/helpers/common_widget_functions.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'About'),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Image.asset(
            'assets/images/1.jpg',
            fit: BoxFit.cover,
          ),
          bodyText1(
            'Bhai Gurdas Group of Institutions, committed to the cause of skilled and quality education at par with Global Standards, appeared on the academic front in 2002. Bhai Gurdas Group has the credit of establishing the first private engineering college in Punjab. The Group has successfully been running seven institutions in various districts of Punjab. Bhai Gurdas Group has been established with the objective of providing high quality education in Engineering, Technology, Management and medical sciences. This year the group has introduced one more institiute of Technology.This is a PTU affiliated and AICTE approved institution. The ultimate aim of the Institution is to create a better nation by creating better citizens. Bhai Gurdas Group of Institutes believes in overall growth of its students.that they remain united with their humane ways of living.',
            context,
          ),
        ],
      ),
    );
  }
}
