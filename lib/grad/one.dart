import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xFF036666), width: 3),
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back,
                color: Color(0xFF036666),
                size: 30,
              ),
            ),
          ),
        ),
        title: const Text(
          "Language",
          style: TextStyle(
            color: Color(0xFF036666),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          SizedBox(height: 60),
          ProfileCard(
            imagePath: "images/english.png",
            title: "English",
            width: 260,
            height: 200,
            imageSize: 60,
            alignment: Alignment.center,
          ),
          const SizedBox(height: 90),

          ProfileCard(
            imagePath: "images/Arabic.png",
            title: "Arabic",
            width: 260,
            height: 200,
            imageSize: 60,
            alignment: Alignment.center,
          ),
          const SizedBox(height: 75),
          ElevatedButton(
            onPressed: () {
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF036666),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 12),
            ),
            child: const Text(
              "Done",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final double width;
  final double height;
  final double imageSize;
  final Alignment alignment;

  const ProfileCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.width,
    required this.height,
    required this.imageSize,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(color: const Color(0xFF036666), width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 180,
                height: 100,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),

            ),
            const SizedBox(height: 30),


            Text(
              title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
