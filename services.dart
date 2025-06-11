import 'package:flutter/material.dart';
import 'package:flutter_project/grad/prescription.dart';

import 'disease.dart';
import 'imaging.dart';
import 'mdetail.dart';
import 'mlab.dart';

void main() {
  runApp(Services());
}

class Services extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Services Screen',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFF036666),
                          width: 2,
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Color(0xFF036666),
                          size: 20,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        padding: EdgeInsets.zero,
                      ),
                    ),


                    SizedBox(width: 20),

                    Text(
                      'Health Recoed',
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
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      CustomRectangle(
                        iconPath: 'images/Primary(2).png',
                        text: 'Medicine',
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => mdetail()),
                        ),
                      ),
                      CustomRectangle(
                        iconPath: 'images/lab.png',
                        text: 'Lab Tests',
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => mlab()),
                        ),
                      ),
                      CustomRectangle(
                        iconPath: 'images/Primary (4).png',
                        text: 'Disease',
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => disease()),
                        ),
                      ),
                      CustomRectangle(
                        iconPath: 'images/Imaging.png',
                        text: 'Imaging',
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => imaging()),
                        ),
                      ),
                      CustomRectangle(
                        iconPath: 'images/Prescription.png',
                        text: 'Prescription',
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => prescription()),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRectangle extends StatelessWidget {
  final String iconPath;
  final String text;
  final VoidCallback onTap;

  CustomRectangle({required this.iconPath, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Color(0xFF036666),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(iconPath, width: 40, height: 40),
              SizedBox(height: 10),
              Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}










