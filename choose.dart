import 'package:flutter/material.dart';

import '../grad/register.dart';
import '../grad/login.dart';

void main() {
  runApp(MaterialApp(home: Choose()));
}

class Choose extends StatefulWidget {
  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  String selectedButton = '';

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
                width: 40,
                height: 40,
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
                  size: 24,
                ),
              ),
            ),
          ),
          Positioned(
            top: 128,
            left: 0,
            child: Image.asset(
              'images/get.png',
              width: 400,
              height: 380,
            ),
          ),
          Positioned(
            top: 42,
            left: 109,
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
          Positioned(
            top: 520,
            left: 50,
            right: 50,
            child: Column(
              children: [
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      selectedButton = 'login';
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Log()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color(0xFF036666), width: 2),
                    backgroundColor: selectedButton == 'login'
                        ? Color(0xFF036666)
                        : Colors.transparent,
                    foregroundColor: selectedButton == 'login'
                        ? Colors.white
                        : Color(0xFF036666),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      selectedButton = 'register';
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Reg()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color(0xFF036666), width: 2),
                    backgroundColor: selectedButton == 'register'
                        ? Color(0xFF036666)
                        : Colors.transparent,
                    foregroundColor: selectedButton == 'register'
                        ? Colors.white
                        : Color(0xFF036666),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
