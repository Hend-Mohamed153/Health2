import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../grad/choose.dart';

void main() {
  runApp(Welcome());
}
class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 128,
            left: 0,
            child: Opacity(
              opacity: 1.0,
              child: SvgPicture.asset(
                'images/Vector.svg',
                fit: BoxFit.cover,
                width: 400,
                height: 410,
              ),
            ),
          ),
          Positioned(
            top: 128,
            left: 0,
            child: Opacity(
              opacity: 1.0,
              child: Image.asset(
                'images/preview.png',
                width: 400,
                height: 380,
              ),
            ),
          ),

          Positioned(
            top: 42,
            left: 109,
            child: Opacity(
              opacity: 1.0,
              child: Container(
                width: 175,
                height: 62,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Health Mate',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    height: 42 / 28,
                    color: Color(0xFF048581),
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: 538,
            left: 95,
            child: Opacity(
              opacity: 1.0,
              child: Container(
                width: 270,
                height: 50,
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Welcome to Health Mate',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    height: 30 / 20,
                    color: Color(0xFF000000),
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: 588,
            left: 64,
            child: Opacity(
              opacity: 1.0,
              child: Container(
                width: 246,
                height: 90,
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Health Mate will help you to save your medical records in one place.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    height: 24 / 16,
                    color: Color(0x4D000000),
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: 718,
            left: 24,
            child: Opacity(
              opacity: 1.0,
              child: SizedBox(
                width: 345,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Choose()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF048581),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Get Started',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      height: 24 / 16,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
