import 'package:flutter/material.dart';
import 'package:flutter_project/grad/create.dart';

void main() {
  runApp(Successfully(email: '',));

}



class Successfully extends StatelessWidget {
  final String email;

  Successfully({required this.email});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 47,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 25.12,
                height: 26.16,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color(0xFF028887),
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: Color(0xFF028887),
                  size: 20,
                ),
              ),
            ),
          ),

          Positioned(
            top: 166,
            left: 48,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Color(0x1A048581),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 224,
            left: 96,
            child: Opacity(
              opacity: 1.0,
              child: Image.asset(
                'images/shield.png',
                width: 200,
                height: 200,
              ),
            ),
          ),

          Positioned(
            top: 561,
            left: 91,
            child: Opacity(
              opacity: 1.0,
              child: Container(
                width: 354,
                height: 30,
                child: Text(
                  'Verified Successfully!',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF000000),
                    height: 1.0,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 700,
            left: 24,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                     MaterialPageRoute(builder: (context) => Create(email: email)),                );
              },
              child: Container(
                width: 345,
                height: 49,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                decoration: BoxDecoration(
                  color: Color(0xFF048581),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
