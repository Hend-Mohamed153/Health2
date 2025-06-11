import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final Color borderColor = Color(0xFF036666);
  int? selectedIndex;
  bool isCleared = false;

  final List<Map<String, String>> notifications = [
    {
      'icon': 'images/reminder.png',
      'title': 'Reminder',
      'subtitle': 'It’s time to take your medicine: Cefotax..'
    },
    {
      'icon': 'images/message.png',
      'title': 'New message',
      'subtitle': 'you have missed message from your doctor.'
    },
    {
      'icon': 'images/update.png',
      'title': 'New update',
      'subtitle': 'Your health record is updated , check it.',
      'time': '11:30 AM'
    },
    {
      'icon': 'images/reminder.png',
      'title': 'Reminder',
      'subtitle': 'It’s time to take your medicine: Cefotax.',
      'time': '8:30 AM'
    },
    {
      'icon': 'images/reminder.png',
      'title': 'Reminder',
      'subtitle': 'DIt’s time to take your medicine: Cefotax.'
    },
    {
      'icon': 'images/message.png',
      'title': 'New message',
      'subtitle': 'you have missed message from your doctor.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: borderColor,
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: borderColor,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'notification',
                      style: TextStyle(
                        color: borderColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30),

                isCleared
                    ? Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/empty.png',
                          height: 300,
                        ),
                        Text(
                          'There is no notifications yet.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                    : Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Today',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isCleared = true;
                              });
                            },
                            child: Text(
                              'Clear all',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Expanded(
                        child: ListView(
                          children: [
                            ...List.generate(3, (index) {
                              final notification = notifications[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: NotificationCard(
                                  icon: notification['icon']!,
                                  title: notification['title']!,
                                  subtitle: notification['subtitle']!,
                                  isSelected: selectedIndex == index,
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                ),
                              );
                            }),

                            Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Yesterday',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            ...List.generate(2, (i) {
                              int index = i + 3;
                              final notification = notifications[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: NotificationCard(
                                  icon: notification['icon']!,
                                  title: notification['title']!,
                                  subtitle: notification['subtitle']!,
                                  isSelected: selectedIndex == index,
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                ),
                              );
                            }),

                            Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                '20 Jan 2025',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: NotificationCard(
                                icon: notifications[5]['icon']!,
                                title: notifications[5]['title']!,
                                subtitle: notifications[5]['subtitle']!,
                                isSelected: selectedIndex == 5,
                                onTap: () {
                                  setState(() {
                                    selectedIndex = 5;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const NotificationCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color borderColor = Color(0xFF036666);
    final Color circleColor = Color(0xFFA3DAF2);
    final Color selectedColor = Color(0xFFDDDDDD);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 90,
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : Colors.white,
          border: Border.all(color: borderColor, width: 1.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: circleColor,
                    ),
                    child: Center(
                      child: Image.asset(
                        icon,
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 8,
              right: 12,
              child: Text(
                '8:00 PM',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
