import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/grad/privacy.dart';
import 'package:flutter_project/grad/profile.dart';
import 'package:flutter_project/grad/recommendation.dart';
import 'package:flutter_project/grad/services.dart';
import 'package:flutter_project/grad/medicine.dart';
import 'package:flutter_project/grad/document.dart';
import 'package:flutter_project/grad/setting.dart';
import 'family.dart';
import 'general.dart';
import 'help.dart';
void main() {
  runApp(MaterialApp(home: HomePage()));
}
class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool showButtons = false;
  final borderRadius = BorderRadius.circular(24);
  final mainColor = Color(0xFF036666);
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RecommendationPage()),
        );
      }
      if (_selectedIndex == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Profile()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.2),
        leading: IconButton(
          icon: Icon(Icons.menu, color: mainColor),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                _buildTransformedImage('images/Primary.png', 40),
                SizedBox(width: 10),
                _buildStackedImages(),
              ],
            ),
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 41),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello, Ali',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: mainColor)),
                  SizedBox(height: 4),
                  Text(
                    'Save time and money, get the best medical service.',
                    style: TextStyle(
                        fontSize: 12,
                        height: 1.5,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: mainColor),
                  ),
                  SizedBox(height: 8),
                  _buildSearchBar(),
                  SizedBox(height: 20),
                  _buildPromoCard(),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Health Record',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: mainColor),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Services()),
                          );
                        },
                        child: Text(
                          'See all',
                          style: TextStyle(
                              fontSize: 14,
                              color: mainColor.withOpacity(0.52),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildServiceItem('images/Primary(2).png', 'Medicine'),
                      _buildServiceItem('images/Primary (3).png', 'BMI'),
                      _buildServiceItem('images/Primary (4).png', 'Disease'),
                    ],
                  ),
                  SizedBox(height: 20),
                  _buildSecondPromoCard(),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
          if (showButtons)
            Positioned(
              right: 16,
              bottom: 130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildActionButton(
                    text: 'Add Medicine',
                    imagePath: 'images/medicine+.png',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Medicine()),
                      );
                    },
                    topPadding: 10,
                  ),
                  _buildActionButton(
                    text: 'Add Document',
                    imagePath: 'images/document.png',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Document()),
                      );
                    },
                    topPadding: 10,
                  ),
                  _buildActionButton(
                    text: 'Add family member',
                    imagePath: 'images/medicine+.png',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Family()),
                      );
                    },
                    topPadding: 10,
                  ),
                ],
              ),
            )
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF036666),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 0.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('images/preview.png', width: 30, height: 30),
                  Image.asset('images/home.png', width: 24, height: 24),
                ],
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/report.png', width: 24, height: 24),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/recommendation.png',
                width: 24, height: 24),
            label: 'Recommendation',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/profile.png', width: 24, height: 24),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      width: 349,
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0x2B000000)),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(
              color: Color(0x80048581),
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
          suffixIcon: Icon(Icons.search, color: Color(0xFF036666), size: 25),
        ),
      ),
    );
  }

  Widget _buildPromoCard() {
    return Container(
      width: double.infinity,
      height: 194,
      decoration: BoxDecoration(
        color: Color(0xFFA3DAF2),
        borderRadius: borderRadius,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GeneralHealth()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA3DAF2),
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'General',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Text(
                  'Health',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Your medical record',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset('images/homeone.png', width: 161, height: 161),
        ],
      ),
    );
  }
  Widget _buildSecondPromoCard() {
    return Container(
      width: double.infinity,
      height: 194,
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        color: Color(0xFFA3DAF2),
        borderRadius: borderRadius,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Contact', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text('Your Doctor', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text('Get simple consultaion.', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              Spacer(),
              Image.asset('images/Online Doctor-rafiki 1.png', width: 161, height: 171),
            ],
          ),
          Positioned(
            top: 160,
            left: 280,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: mainColor,
              onPressed: () {
                setState(() {
                  showButtons = !showButtons;
                });
              },
              child: Icon(showButtons ? Icons.close : Icons.add),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildActionButton({
    required String text,
    required String imagePath,
    required VoidCallback onPressed,
    required double topPadding,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding, right: 30.0),
      child: Align(
        alignment: Alignment.topRight,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 4,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(imagePath, width: 24, height: 24),
              SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF036666),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildServiceItem(String imagePath, String label) {
    return Container(
      width: 96,
      height: 97,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: mainColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 30, height: 30),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
  Widget _buildTransformedImage(String imagePath, double size) {
    return Transform.rotate(
      angle: 5 * 3.1415927 / 180,
      child: Image.asset(imagePath, width: size, height: size),
    );
  }

  Widget _buildStackedImages() {
    return Stack(
      children: [
        _buildTransformedImage('images/Primary(1).png', 40),
        Positioned(
          top: 3,
          left: 14,
          child: Image.asset('images/Ellipse216.png', width: 30, height: 30),
        ),
      ],
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildDrawerHeader(),
          _buildDrawerItem(Icons.person, 'My Profile', context),

          _buildDrawerItemWithImage('images/uil_setting.png', 'Setting', context,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
          _buildDrawerItemWithImage('images/material-symbols-light_security (1).png', 'Privacy & Policy', context,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => privacy()),
              );
            },
          ),
          _buildDrawerItemWithImage('images/material-symbols_help-outline.png', 'Help & Support', context,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpScreen()),
              );
            },
          ),
          _buildDrawerItemWithImage(
            'images/share.png', 'Share', context,
            onTap: () {
              Navigator.pop(context);
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Share',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildShareIcon('images/logos_whatsapp-icon.png', 'WhatsApp'),
                            _buildShareIcon('images/logos_facebook.png', 'Facebook'),
                            _buildShareIcon('images/logos_telegram.png', 'Telegram'),
                            _buildShareIcon('images/icon-park_message-one.png', 'Chat'),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Color(0xFFEFEFEF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'https://yourapp.link/share',
                                  style: TextStyle(color: Colors.black54),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.copy, color: Color(0xFF036666)),
                                onPressed: () {
                                  Clipboard.setData(ClipboardData(text: 'https://yourapp.link/share'));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Link copied to clipboard!')),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          Divider(),
          _buildDrawerItemWithImage('images/material-symbols_logout.png', 'Log out', context),
        ],
      ),
    );
  }
  Widget _buildDrawerHeader() {
    return DrawerHeader(
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage('images/Rectangle 1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 22),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hana Ahmed',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF048581))),
              SizedBox(height: 10),
              Text('Hanaahmed233@gmail.com',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF048581))),
            ],
          ),
        ],
      ),
    );
  }
  Widget _buildDrawerItem(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal),
      title: Text(title,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xFF048581))),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.teal),
      onTap: () => Navigator.pop(context),
    );
  }
  Widget _buildDrawerItemWithImage(
      String imagePath, String title, BuildContext context, {VoidCallback? onTap}) {
    return ListTile(
      leading: Image.asset(imagePath, width: 24, height: 24),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
      onTap: onTap ?? () => Navigator.pop(context),
    );
  }
  Widget _buildShareIcon(String imagePath, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Color(0xFFE0F2F1),
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(10),
          child: Image.asset(imagePath),
        ),
        SizedBox(height: 6),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

}
