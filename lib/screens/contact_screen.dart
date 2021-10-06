import 'package:bgiet/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Row(
            children: const [
              SizedBox(width: 10),
              Icon(
                Icons.call,
                color: Colors.amber,
                size: 40,
              ),
              SizedBox(width: 10),
              Text(
                'Call Us',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text('01672-278528'),
          Text('01672-278529')
        ],
      ),
    );
  }
}
