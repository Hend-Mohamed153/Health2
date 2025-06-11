import 'package:flutter/material.dart';

void main() {
  runApp(prescription());
}

class prescription extends StatefulWidget {
  @override
  _mdetailState createState() => _mdetailState();
}

class _mdetailState extends State<prescription> {
  final TextStyle fadedTextStyle = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.41),
    fontWeight: FontWeight.bold,
  );

  final List<Map<String, String>> records = [
    {
      'date': '18 Feb 2024',
      'doctor': 'Ali Ahmed',
      'med1': 'Sefotax',
      'med2': 'panadol',
      'med3': 'Glycodal',
    },
    {
      'date': '18 Feb 2024',
      'doctor': 'Ali Ahmed',
      'med1': 'Sefotax',
      'med2': 'panadol',
      'med3': 'Glycodal',
    },
    {
      'date': '18 Feb 2024',
      'doctor': 'Ali Ahmed',
      'med1': 'Sefotax',
      'med2': 'panadol',
      'med3': 'Glycodal',
    },
    {
      'date': '18 Feb 2024',
      'doctor': 'Ali Ahmed',
      'med1': 'Sefotax',
      'med2': 'panadol',
      'med3': 'Glycodal',
    },
    {
      'date': '18 Feb 2024',
      'doctor': 'Ali Ahmed',
      'med1': 'Sefotax',
      'med2': 'panadol',
      'med3': 'Glycodal',
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
                      'Prescription',
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
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(child: Text(record['doctor'] ?? '', textAlign: TextAlign.right)),
                                      SizedBox(width: 10),
                                      Text('Doctor', style: fadedTextStyle),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Expanded(child: Text(record['med1'] ?? '', textAlign: TextAlign.right)),
                                      SizedBox(width: 10),
                                      Text('Medicine 1', style: fadedTextStyle),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Expanded(child: Text(record['med2'] ?? '', textAlign: TextAlign.right)),
                                      SizedBox(width: 10),
                                      Text('Medicine 2', style: fadedTextStyle),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Expanded(child: Text(record['med3'] ?? '', textAlign: TextAlign.right)),
                                      SizedBox(width: 10),
                                      Text('Medicine 3', style: fadedTextStyle),
                                    ],
                                  ),
                                ],
                              ),
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
