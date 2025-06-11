import 'package:flutter/material.dart';

void main() {
  runApp(disease());
}

class disease extends StatefulWidget {
  @override
  _mdetailState createState() => _mdetailState();
}

class _mdetailState extends State<disease> {
  final TextStyle fadedTextStyle = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.41),
    fontWeight: FontWeight.bold,
  );

  final List<Map<String, String>> records = [
    {
      'date': '18 Feb 2024',
      'diseaseName': 'PCOS',
      'bodySite': 'Uterus',
      'severity': 'Severe',
    },
    {
      'date': '1 Jul 2024',
      'diseaseName': 'Diabetes',
      'bodySite': 'Blood',
      'severity': 'Moderate',
    },
    {
      'date': '8 Feb 2025',
      'diseaseName': 'Hypothyroidism',
      'bodySite': 'Thyroid gland',
      'severity': 'Mild',
    },
    {
      'date': '8 Feb 2025',
      'diseaseName': 'Hypothyroidism',
      'bodySite': 'Thyroid gland',
      'severity': 'Mild',
    },
    {
      'date': '8 Feb 2025',
      'diseaseName': 'Hypothyroidism',
      'bodySite': 'Thyroid gland',
      'severity': 'Mild',
    },
  ];


  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'disease',
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
                      'Disease',
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
                                      Text('Disease Name:', style: fadedTextStyle),
                                      SizedBox(height: 5),
                                      Text('Body Site:', style: fadedTextStyle),
                                      SizedBox(height: 5),
                                      Text('Severity:', style: fadedTextStyle),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        record['diseaseName'] ?? '',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(color: Colors.black,fontSize: 15),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        record['bodySite'] ?? '',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(color: Colors.black,fontSize: 15),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        record['severity'] ?? '',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(color: Colors.black,fontSize: 15),
                                      ),
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
