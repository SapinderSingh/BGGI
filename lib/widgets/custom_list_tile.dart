import 'package:bgiet/helpers/common_functions.dart';
import 'package:bgiet/helpers/common_widget_functions.dart';
import 'package:bgiet/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.title,
    required this.haveTrailingIcon,
    required this.isLink,
    required this.placeToGoTo,
    required this.toBeReplaced,
    this.leading,
    this.subtitle,
    this.arguments,
  }) : super(key: key);

  final String? subtitle;
  final String title, placeToGoTo;
  final Object? arguments;
  final bool haveTrailingIcon, isLink, toBeReplaced;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: isLink
          ? () => showDialog(
                context: context,
                builder: (ctx) => CustomAlertDialog(
                  onPressed: () {
                    CommonFunctions.launchURL(placeToGoTo, ctx);
                    Navigator.of(context).pop();
                  },
                ),
              )
          : () => toBeReplaced
              ? Navigator.of(context)
                  .pushReplacementNamed(placeToGoTo, arguments: arguments)
              : Navigator.of(context)
                  .pushNamed(placeToGoTo, arguments: arguments),
      title: bodyText2(context, title),
      subtitle: subtitle == null ? null : Text(subtitle!),
      leading: leading,
      trailing: haveTrailingIcon
          ? Icon(
              Icons.arrow_forward,
              color: Theme.of(context).iconTheme.color,
            )
          : null,
    );
  }
}
