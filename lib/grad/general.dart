import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GeneralHealth(),
    );
  }
}
class GeneralHealth extends StatelessWidget {
  const GeneralHealth({super.key});

  Widget buildCard({
    required String title,
    required String value,
    required String status,
    required Widget iconWidget,
    required Color textColor,
    required Color indicatorColor,
    BoxDecoration? decoration,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: decoration ??
          BoxDecoration(
            border: Border.all(color: const Color(0xFF036666)),
            borderRadius: BorderRadius.circular(12),
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 48,
            height: 48,
            child: iconWidget,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(
                status.contains("Higher")
                    ? Icons.arrow_upward_rounded
                    : Icons.arrow_downward_rounded,
                color: indicatorColor,
                size: 20,
              ),
              const SizedBox(width: 1),
              Text(
                status,
                style: TextStyle(color: textColor, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildBloodPressure(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(7, (index) {
          return Container(
            width: 8,
            height: 70,
            decoration: BoxDecoration(
              color: index % 2 == 0 ? color : Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(6),
            ),
          );
        }),
      ),
    );
  }

  Widget buildBloodRangeCard(
      String label,
      String value,
      Color bgColor,
      Color textColor, {
        required Widget iconWidget,
      }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF036666)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: textColor,
              ),
            ),
          ),
          const SizedBox(height: 1),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: iconWidget,
              ),
              const SizedBox(width: 7),
            ],
          ),
          const SizedBox(height: 1),
          Text(
            label,
            style: TextStyle(fontSize: 14, color: textColor),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFF036666), width: 2),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: Color(0xFF036666),
                      size: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                "General Health",
                style: TextStyle(
                  color: Color(0xFF036666),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello , Ali',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF036666)),
              ),
              const SizedBox(height: 4),
              const Text(
                'Check your health.',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              const SizedBox(height: 16),
              Container(
                width: 349,
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFF036666)),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText:
                    '                                               Search',
                    hintStyle: TextStyle(
                      color: Color(0x80048581),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                    ),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                    suffixIcon:
                    Icon(Icons.search, color: Color(0xFF036666), size: 30),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: buildCard(
                      title: 'Blood Status',
                      value: '100/70',
                      status: 'Higher than average',
                      iconWidget: Image.asset(
                        'images/dropblood.png',
                        width: 24,
                        height: 24,
                      ),
                      textColor: Colors.black54,
                      indicatorColor: Colors.red,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: buildCard(
                      title: 'Glucose Level',
                      value: '78/92',
                      status: 'Higher than average',
                      iconWidget: Image.asset(
                        'images/glucose level.png',
                        width: 24,
                        height: 24,
                      ),
                      textColor: Colors.black54,
                      indicatorColor: Colors.red,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Color(0xFFE0FFFF), Color(0xFFFFFFFF)],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFF036666)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: buildCard(
                      title: 'Heart Rate',
                      value: '78 bmp',
                      status: 'Lower than average',
                      iconWidget: Image.asset(
                        'images/heart rate.png',
                        width: 24,
                        height: 24,
                      ),
                      textColor: Colors.black54,
                      indicatorColor: Colors.red,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Color(0xFFFFC8C8), Color(0xFFFFFFFF)],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFF036666)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      children: [
                        buildBloodRangeCard(
                          'Lowest Blood Pressure',
                          '49/128',
                          Colors.white,
                          const Color(0xFF036666),
                          iconWidget: Image.asset('images/healthicons_low-bars-outline.png'),
                        ),
                        const SizedBox(height: 12),
                        buildBloodRangeCard(
                          'Highest Blood Pressure',
                          '49/128',
                          const Color(0xFF004D47),
                          const Color(0xB0FFFFFF),
                          iconWidget: Image.asset('images/healthicons_high-bars-outline.png'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF036666)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildBloodPressure("Blood Pressure", Colors.orange),
                    const SizedBox(height: 10),
                    const Text(
                      'Hemoglobin',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      '100 mg/dl',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
