import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Ver.dart';

void main() {
  runApp(MaterialApp(home: Forget()));
}

class Forget extends StatefulWidget {
  @override
  _ForgetState createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  Future<void> sendVerificationCode(String email) async {
    final url = Uri.parse('https://healthmate.runasp.net/api/Account/send-verification-code?emailAddress=$email');

    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(url);
      setState(() {
        isLoading = false;
      });

      if (response.statusCode == 200) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => Ver(email: email)));
      } else {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('Error'),
            content: Text('Failed to send verification code. Please try again.'),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))
            ],
          ),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Error'),
          content: Text('An error occurred. Please check your internet connection.'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: 780,
          child: Stack(
            children: [
              Positioned(
                top: 76,
                left: 93,
                child: Text(
                  'Forget Password',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF048581),
                    height: 36 / 24,
                  ),
                ),
              ),
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
                top: 216,
                left: 98,
                child: Image.asset(
                  'images/sec.png',
                  width: 200,
                  height: 200,
                ),
              ),
              Positioned(
                top: 525,
                left: 48,
                child: Container(
                  width: 300,
                  height: 60,
                  alignment: Alignment.center,
                  child: Text(
                    'Please Enter Your Email Address To Verify.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000000),
                      height: 30 / 20,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 610,
                left: 20,
                child: Container(
                  width: 353,
                  height: 51,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Color(0x2B000000),
                      width: 1,
                    ),
                  ),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Color(0x80048581),
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 720,
                left: 24,
                child: GestureDetector(
                  onTap: () {
                    final email = emailController.text.trim();
                    if (email.isEmpty || !email.contains('@')) {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text('Invalid Email'),
                          content: Text('Please enter a valid email address.'),
                          actions: [
                            TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))
                          ],
                        ),
                      );
                      return;
                    }
                    sendVerificationCode(email);
                  },
                  child: Container(
                    width: 345,
                    height: 49,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    decoration: BoxDecoration(
                      color: Color(0xFF048581),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                        'Send',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          height: 1.5,
                          decoration: TextDecoration.none,
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
