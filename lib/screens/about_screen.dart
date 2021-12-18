import 'package:bgiet/widgets/custom_app_bar.dart';
import 'package:bgiet/widgets/main_drawer.dart';
import 'package:bgiet/widgets/press_back_again_to_close.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: customAppBar(
        title: 'About Us',
        context: context,
      ),
      body: pressBackAgainToClose(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            Image.asset(
              'assets/images/1.jpg',
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Bhai Gurdas Institute of Engineering and Technology, committed to the cause of skilled and quality education at par with Global Standards, appeared on the academic front in 2002. Bhai Gurdas Group has the credit of establishing the first private engineering college in Punjab. The Group has successfully been running seventeen institutions in various districts of Punjab. Bhai Gurdas Group has been established with the objective of providing high-quality education in Engineering, Technology, Management, and medical sciences. This year the group has introduced one more institute of Technology. This is an I.K.G. Punjab Technical University, Kapurthala. affiliated and AICTE approved institution. The ultimate aim of the Institution is to create a better nation by creating better citizens. Bhai Gurdas Group of Institutes believes in the overall growth of its students.that they remain united with their human ways of living.',
              style: Theme.of(context).primaryTextTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
