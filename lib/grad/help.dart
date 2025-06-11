import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  final Color mainColor = Color(0xFF036666);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: mainColor,
                        width: 2,
                      ),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.arrow_back,
                        color: mainColor,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Help & Support',
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for help',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xFF036666),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey[600],
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Color(0xFF036666),
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Color(0xFF036666),
                      width: 2,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Image.asset(
                    'images/help.png',
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Frequently Asked Questions',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '(FAQs)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Container(
                width: 300,
                child: Divider(
                  color: Colors.grey[400],
                  thickness: 1.0,
                ),
              ),
            ),
            ExpansionTile(
              title: Text('. How can I update my profile Settings?',
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'You can update your account settings by following these steps:\n'
                        '1. Log in to your account.\n'
                        '2. Click on your profile icon (in the top right corner) or select "My profile" from the sidebar menu.\n'
                        '3. Update the desired information (e.g., name, email, phone number, password, notification preferences).\n'
                        '4. Click "Save" to apply the updates.',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('. How can I change my profile image ?',
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ' You can update your profile image by following these steps:\n'
                        '1. Log in to your account.\n'
                        '2. Click on your profile icon ( in the top left corner of the sidebar) or Select "My profile" from the sidebar.\n'
                        '3. press "change profile image" and choose image you want from your device.\n'
                        '4. Click "Save" to apply the updates.',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('. How can I contact customer services?',
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'You can contact our customer services by following these steps:\n'
                        '1. Log in to your account.\n'
                        '2. Click on icon ( in the top left corner of the sidebar) to open sidebar.\n'
                        '3. press "chat our team" and send them message.\n'
                        '4. you will receive response with in 24 hours.',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.language,
                    color: Color(0xFF036666),
                    size: 24,
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      'Multi-Language Support',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Container(
                width: 300,
                child: Divider(
                  color: Colors.grey[400],
                  thickness: 1.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Allow users to switch the help section to different languages for better accessibility.',
                style: TextStyle(color: Colors.black,fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                children: [
                  Image.asset(
                    'images/setting.png',
                    width: 24,
                    height: 24,
                    color: Color(0xFF036666),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      'Report a problem',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Container(
                width: 300,
                child: Divider(
                  color: Colors.grey[400],
                  thickness: 1.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
              'A simple form where users can describe an issue and send logs/screenshots for faster troubleshooting.',
                style: TextStyle(color: Colors.black,fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}
