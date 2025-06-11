import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Medicine(),
    );
  }
}

class Medicine extends StatefulWidget {
  @override
  _MedicineState createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  int selectedTimeIndex = -1;

  final List<String> hours = List.generate(12, (index) => "${index + 1} hrs");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  const SectionTitle(title: 'Medicine Name'),
                  const DashedTextField(hintText: "e.g.zithroma"),
                  const SizedBox(height: 25),
                  const SectionTitle(title: 'Dosage'),
                  const DashedTextField(hintText: "e.g.two tablets"),
                  const SizedBox(height: 25),
                  const SectionTitle(title: 'Days'),
                  const DashedTextField(hintText: "e.g.7 days"),
                  const SizedBox(height: 30),
                  const SectionTitle(title: 'Time'),
                  const Text(
                    'Every how many hours?',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.transparent),
                      ),
                      child: CustomPaint(
                        painter: DashedBorderPainter(),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              hours.length,
                                  (index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedTimeIndex = index;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 25),
                                  child: Text(
                                    hours[index],
                                    style: TextStyle(
                                      color: selectedTimeIndex == index
                                          ? Color(0xFF036666)
                                          : Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            Future.delayed(Duration(seconds: 2), () {
                              Navigator.of(context).pop();
                            });
                            return Dialog(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              child: SuccessDialog(),
                            );
                          },
                        );
                      },
                      child: Container(
                        width: 345,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF036666),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFF028887), width: 2),
                ),
                child: const Center(
                  child: Icon(Icons.arrow_back, color: Color(0xFF028887), size: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 24,
        fontWeight: FontWeight.w600,
        height: 1.5,
        color: Colors.black,
        decoration: TextDecoration.none,
      ),
    );
  }
}

class DashedTextField extends StatelessWidget {
  final String hintText;

  const DashedTextField({required this.hintText});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedBorderPainter(),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          ),
        ),
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    double dashWidth = 8, dashSpace = 4;
    final Path path = Path();

    for (double startX = 0; startX < size.width; startX += dashWidth + dashSpace) {
      path.moveTo(startX, 0);
      path.lineTo(startX + dashWidth, 0);
      path.moveTo(startX, size.height);
      path.lineTo(startX + dashWidth, size.height);
    }

    for (double startY = 0; startY < size.height; startY += dashWidth + dashSpace) {
      path.moveTo(0, startY);
      path.lineTo(0, startY + dashWidth);
      path.moveTo(size.width, startY);
      path.lineTo(size.width, startY + dashWidth);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class SuccessDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 220,
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.green,
                    width: 4,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Submitted Successfully",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
