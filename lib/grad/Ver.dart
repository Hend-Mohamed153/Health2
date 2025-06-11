import 'package:flutter/material.dart';
import 'package:flutter_project/grad/successfully.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(home: Ver(email: 'example@example.com')));
}

class Ver extends StatefulWidget {
  final String email;

  Ver({required this.email});

  @override
  _VerState createState() => _VerState();
}

class _VerState extends State<Ver> {
  final TextEditingController codeController1 = TextEditingController();
  final TextEditingController codeController2 = TextEditingController();
  final TextEditingController codeController3 = TextEditingController();
  final TextEditingController codeController4 = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    codeController1.dispose();
    codeController2.dispose();
    codeController3.dispose();
    codeController4.dispose();
    super.dispose();
  }

  Future<void> verifyCode() async {
    setState(() {
      isLoading = true;
    });

    String code = codeController1.text +
        codeController2.text +
        codeController3.text +
        codeController4.text;

    Map<String, String> body = {
      'email': widget.email,
      'code': code,
    };

    try {
      final response = await http.post(
        Uri.parse('https://healthmate.runasp.net/api/Account/verify-code'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Successfully(email: widget.email)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Verification failed. Please try again.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                top: 50,
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
                top: 45,
                left: 93,
                child: Opacity(
                  opacity: 1.0,
                  child: Text(
                    'Verify Your Email',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF048581),
                      height: 36 / 24,
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
                top: 216,
                left: 96,
                child: Opacity(
                  opacity: 1.0,
                  child: Image.asset(
                    'images/mail.png',
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
              Positioned(
                top: 480,
                left: 46,
                child: Container(
                  width: 300,
                  height: 60,
                  alignment: Alignment.center,
                  child: Text(
                    'Verification code sent to: ${widget.email}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000000),
                      height: 30 / 20,
                    ),
                  ),
                ),
              ),
              for (int i = 0; i < 4; i++)
                Positioned(
                  top: 580,
                  left: 46.0 + i * 82,
                  child: Container(
                    width: 48,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Color.fromRGBO(37, 112, 68, 0.7),
                        width: 2,
                      ),
                    ),
                    child: TextField(
                      controller: [codeController1, codeController2, codeController3, codeController4][i],
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: "",
                      ),
                    ),
                  ),
                ),
              Positioned(
                top: 630,
                left: 140,
                child: TextButton(
                  onPressed: () {
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    'Resend Code',
                    style: TextStyle(
                      color: Color(0x4D000000),
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 690,
                left: 24,
                child: GestureDetector(
                  onTap: isLoading ? null : verifyCode,
                  child: Container(
                    width: 345,
                    height: 49,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    decoration: BoxDecoration(
                      color: Color(0xFF048581),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                        'Verify',
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
        ),
      ),
    );
  }
}
