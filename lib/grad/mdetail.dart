import 'package:flutter/material.dart';

void main() {
  runApp(mdetail());
}

class mdetail extends StatefulWidget {
  @override
  _mdetailState createState() => _mdetailState();
}

class _mdetailState extends State<mdetail> {
  final TextStyle fadedTextStyle = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.41),
    fontWeight: FontWeight.bold,
  );

  final List<Map<String, String>> records = [
    {
      'date': '           18 Feb 2024',
      'treatment': '                   ERASTAPEX',
      'potion': '                    One Tablet',
      'for': '                      10 Days',
      'every': '                    24 Hours',
    },
    {
      'date': '           1 Jul 2024',
      'treatment': '                   Medicine2',
      'potion': '                    One Tablet',
      'for': '                      14 days',
      'every': '                    6 Hours',
    },
    {
      'date': '           8 Feb 2025',
      'treatment': '                   Medicine3',
      'potion': '                    10 ml',
      'for': '                      6 Days',
      'every': '                    12 Hours',
    },
    {
      'date': '           5 Jan 2025',
      'treatment': '                   Medicine4',
      'potion': '                    One Tablet',
      'for': '                      9 Days',
      'every': '                    8 Hours',
    },
    {
      'date': '           10 Feb 2025',
      'treatment': '                   Medicine5',
      'potion': '                    One Tablet',
      'for': '                     10 Days',
      'every': '                    24 Hours',
    },
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medicine Screen',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xFF036666),
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Color(0xFF036666),
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Medicine',
                      style: TextStyle(
                        color: Color(0xFF036666),
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    Image.asset(
                      'images/notification.png',
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
              ),

              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemCount: records.length,
                  itemBuilder: (context, index) {
                    final record = records[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedIndex == index
                                ? Color(0xFFFF0303)
                                : Color(0xFF036666),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Spacer(),
                                Text(
                                  record['date'] ?? '',
                                  style: TextStyle(
                                    color: Color(0xFF036666),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Image.asset(
                                      'images/note.png',
                                      color: Color(0xFF036666),
                                      width: 20,
                                      height: 20,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Note',
                                      style: TextStyle(
                                        color: Color(0xFF036666),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Treatment:', style: fadedTextStyle),
                                      SizedBox(height: 5),
                                      Text('Potion:', style: fadedTextStyle),
                                      SizedBox(height: 5),
                                      Text('For:', style: fadedTextStyle),
                                      SizedBox(height: 5),
                                      Text('Every:', style: fadedTextStyle),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(record['treatment'] ?? ''),
                                      SizedBox(height: 5),
                                      Text(record['potion'] ?? ''),
                                      SizedBox(height: 5),
                                      Text(record['for'] ?? ''),
                                      SizedBox(height: 5),
                                      Text(record['every'] ?? ''),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
