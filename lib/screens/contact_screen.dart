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
      body: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
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
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 60,
                ),
                Text(
                  '01672-278528',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 60,
                ),
                Text(
                  '01672-278529',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                SizedBox(width: 10),
                Icon(
                  Icons.email,
                  color: Colors.amber,
                  size: 40,
                ),
                SizedBox(width: 10),
                Text(
                  'Email Us',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 60,
                ),
                Text(
                  'info@bgiet.ac.in',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                SizedBox(width: 10),
                Icon(
                  Icons.location_pin,
                  color: Colors.amber,
                  size: 40,
                ),
                SizedBox(width: 10),
                Text(
                  'Address',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 60,
                ),
                Expanded(
                  child: Text(
                    'BHAI GURDAS INSTITUTE OF ENGINEERING & TECHNOLOGY Main Patiala Road, NH-7, Sangrur, Pin 148001 Punjab (INDIA)',
                    style: TextStyle(
                      fontSize: 18,
                    ),
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
