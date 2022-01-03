import 'package:bgiet/helpers/common_functions.dart';
import 'package:bgiet/helpers/common_widget_functions.dart';
import 'package:bgiet/widgets/custom_alert_dialog.dart';
import 'package:bgiet/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class DeveloperScreen extends StatelessWidget {
  const DeveloperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('About the Developer'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 44.1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              dynamicHeightSizedBox(context, height: 20),
              const Center(
                child: CircleAvatar(
                  child: CircularProgressIndicator(),
                  radius: 100,
                  foregroundImage: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/bgiet-fbe7c.appspot.com/o/Images%2FWhatsApp%20Image%202020-03-13%20at%205.40.15%20AM.jpeg?alt=media&token=6b38dd4f-9b71-4019-89b0-ee3f89e663b0'),
                ),
              ),
              dynamicHeightSizedBox(context, height: 20),
              h6Text(context, 'Developer\'s Note'),
              bodyText1(
                "Greetings Everyone, My name is Sapinder Singh. I am a student of the 2019 batch in this college. I have made this app not only for the college but also for the students, so that they become motivated to do these kind of things in their college days. I want to thank my parents who supported me in this journey. I want to thank my teacher Mr. Abhinas Singla and the Bhai Gurdas Group for giving me this opportunity. I especially want to thank Diksha Shahi who supported me, guided me and contributed in making of this app. At the end, I want to thank the Alimighty God for everything. I have put immense hardwork to make this app. I hope you will like it.",
                context,
              ),
              Center(
                child: ElevatedButton(
                  child: const Text('Contact Me'),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (_) => CustomAlertDialog(
                      content:
                          'This will take you to an external website, Do you want to continue ?',
                      onPressed: () => CommonFunctions.launchURL(
                        'https://www.linktree.com/sapindersingh',
                        context,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
