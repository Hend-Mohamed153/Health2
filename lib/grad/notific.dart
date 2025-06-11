import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: NotificationsPage(),
  ));
}

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Color(0xFF036666), width: 2),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: const Icon(Icons.arrow_back, color: Color(0xFF036666), size: 20),
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Notification',
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFF036666),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDateSection(
              "Today",
              _todayNotifications(),
              showClearAll: true,
            ),
            SizedBox(height: 24),
            _buildDateSection("Yesterday", _yesterdayNotifications()),
            SizedBox(height: 24),
            _buildDateSection("20 Jan 2025", _januaryNotifications()),
          ],
        ),
      ),
    );
  }

  Widget _buildDateSection(String title, List<Widget> notifications, {bool showClearAll = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            if (showClearAll)
              TextButton(
                onPressed: () {
                },
                child: Text(
                  "Clear all",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 12),
        Column(
          children: notifications,
        ),
      ],
    );
  }

  List<Widget> _todayNotifications() {
    return [
      _buildNotificationItem(
        title: "Reminder",
        content: "It's time to take your medicine: Cefotax.",
        time: "8:00 pm",
        isImportant: true,
      ),
      _buildNotificationItem(
        title: "New message",
        content: "You have missed a message from your doctor.",
        time: "8:00 pm",
      ),
      _buildNotificationItem(
        title: "New update",
        content: "Your health record is updated, check it.",
        time: "8:00 pm",
      ),
    ];
  }

  List<Widget> _yesterdayNotifications() {
    return [
      _buildNotificationItem(
        title: "Reminder",
        content: "It's time to take your medicine: Cefotax.",
        time: "8:00 pm",
        isImportant: true,
      ),
      _buildNotificationItem(
        title: "Reminder",
        content: "It's time to take your medicine: Cefotax.",
        time: "8:00 pm",
      ),
    ];
  }

  List<Widget> _januaryNotifications() {
    return [
      _buildNotificationItem(
        title: "New message",
        content: "You have missed a message from your doctor.",
        time: "8:00 pm",
      ),
    ];
  }

  Widget _buildNotificationItem({
    required String title,
    required String content,
    required String time,
    bool isImportant = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF036666)),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 12),
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Color(0xFFA3DAF2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _getNotificationIcon(title),
              color: Colors.blue,
              size: 24,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: title == "Reminder"
                        ? Colors.black
                        : (isImportant ? Colors.red : Colors.black),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  content,
                  style: TextStyle(color: Colors.grey[700]),
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    time,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
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


  IconData _getNotificationIcon(String title) {
    if (title.contains("Reminder")) return Icons.notifications_active;
    if (title.contains("message")) return Icons.message;
    if (title.contains("update")) return Icons.update;
    return Icons.notifications;
  }
}
