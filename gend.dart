import 'package:flutter/material.dart';
import 'package:flutter_project/grad/remain.dart';

class GenderSelection extends StatefulWidget {
  final String userId;
  const GenderSelection({required this.userId});
  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  bool isMaleSelected = false;
  bool isFemaleSelected = false;
  int? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          Positioned(
            top: 40,
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
                    color: Color(0xFF036666),
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: Color(0xFF036666),
                  size: 24,
                ),
              ),
            ),
          ),
          Positioned(
            top: -40,
            left: 269,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Color(0x3F048581),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: -20,
            left: 289,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                color: Color(0xFF048581),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 122,
            left: 74,
            child: Container(
              width: 245,
              height: 38,
              child: Center(
                child: Text(
                  'Select your Gender',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF038588),
                  ),
                ),
              ),
            ),
          ),
          // Circle for Male
          Positioned(
            top: 195,
            left: 115,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isMaleSelected = true;
                  isFemaleSelected = false;
                  selectedGender = 0; // Male selected
                });
              },
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: isMaleSelected ? Color(0xFF028887) : Colors.transparent,
                  border: Border.all(
                    color: Color(0xFF036666),
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.male,
                    color: isMaleSelected ? Colors.white : Color(0xFF036666),
                    size: 80,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 469,
            left: 115,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isFemaleSelected = true;
                  isMaleSelected = false;
                  selectedGender = 1;
                });
              },
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: isFemaleSelected ? Color(0xFF028887) : Colors.transparent,
                  border: Border.all(
                    color: Color(0xFF036666),
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.female,
                    color: isFemaleSelected ? Colors.white : Color(0xFF036666),
                    size: 80,
                  ),
                ),
              ),
            ),
          ),
          // Male text
          Positioned(
            top: 375,
            left: 171,
            child: Container(
              width: 58,
              height: 36,
              child: Center(
                child: Text(
                  'Male',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF036666),
                  ),
                ),
              ),
            ),
          ),
          // Female text
          Positioned(
            top: 649,
            left: 161,
            child: Container(
              width: 89,
              height: 36,
              child: Center(
                child: Text(
                  'Female',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF036666),
                  ),
                ),
              ),
            ),
          ),
          // Button "Next"
          Positioned(
            bottom: 30,
            left: 24,
            right: 24,
            child: ElevatedButton(
              onPressed: () {
                if (selectedGender != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Remain(
                        userId: widget.userId,
                        selectedGender: selectedGender!,
                      ),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Gender Required'),
                        content: Text('Please select your gender before proceeding.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF036666),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 150, vertical: 15),
              ),
              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
