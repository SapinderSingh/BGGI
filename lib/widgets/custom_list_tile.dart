import 'package:bgiet/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.title,
    required this.haveTrailingIcon,
    required this.isLink,
    required this.placeToGoTo,
    required this.toBeReplaced,
  }) : super(key: key);

  final String title, placeToGoTo;

  final bool haveTrailingIcon, isLink, toBeReplaced;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: isLink
          ? () => showDialog(
                context: context,
                builder: (_) => CustomAlertDialog(
                  onPressed: () {
                    _launchURL(placeToGoTo);
                    Navigator.of(context).pop();
                  },
                ),
              )
          : () => toBeReplaced
              ? Navigator.of(context).pushReplacementNamed(placeToGoTo)
              : Navigator.of(context).pushNamed(placeToGoTo),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: GoogleFonts.lora().fontFamily,
        ),
      ),
      trailing: haveTrailingIcon
          ? Icon(
              Icons.arrow_forward,
              color: Theme.of(context).iconTheme.color,
            )
          : null,
    );
  }

  void _launchURL(String url) async {
    try {
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
    } on Exception catch (e) {
      print(e);
    }
  }
}
