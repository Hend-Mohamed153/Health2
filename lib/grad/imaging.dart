import 'package:flutter/material.dart';

import 'imagdetal.dart';

void main() {
  runApp(imaging());
}

class imaging extends StatelessWidget {
  final List<Map<String, String>> labTests = [
    {'text': 'Head CT', 'date': '5 Jan 2025'},
    {'text': 'Chest CT', 'date': '8 feb 2025'},
    {'text': 'Gland x-ray', 'date': '10 mar 2025'},
    {'text': 'knee MRI', 'date': '2 Apr 2025'},
    {'text': 'Leg Ultrasonic', 'date': '5 Jun 2025'},
    {'text': 'Full Body MRI', 'date': '5 Jul 2025'},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mlab',
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
                      'Imaging',
                      style: TextStyle(
                        color: Color(0xFF036666),
                        fontSize: 24,
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
                  itemCount: labTests.length,
                  itemBuilder: (context, index) {
                    String text = labTests[index]['text']!;
                    String date = labTests[index]['date']!;

                    return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF036666), width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'images/ima.png',
                                color: Color(0xFF036666),
                                width: 35,
                                height: 35,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      text,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      date,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Imagdetail(
                                      testName: text,
                                      testDate: date,
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF036666),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: Text(
                                'Details',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
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
