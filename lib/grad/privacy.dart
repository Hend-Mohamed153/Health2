import 'package:flutter/material.dart';

void main() {
  runApp(privacy());
}
class privacy extends StatelessWidget {
  final Color mainColor = Color(0xFF036666);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xFF036666),
                        width: 2,
                      ),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.arrow_back,
                        color: Color(0xFF036666),
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Privacy Policy',
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    policySection(
                      title: "Introduction",
                      content:
                      "Welcome to our Health Mate. Your privacy is important to us. This Privacy Policy explains how we collect, use, disclose, and protect your information when you use our website/app.\n\nBy using our services, you agree to the terms outlined in this Privacy Policy.",
                    ),
                    policySection(
                      title: "2. Information We Collect",
                      content:
                      "We may collect the following types of information:\n- Personal Information: Name, email, phone number, and some other details.\n- Usage Data: Pages visited, time spent on our site, and interactions.\n- Device Information: IP address, browser type, and operating system.\n- Cookies & Tracking Technologies: We use cookies to enhance your experience. You can manage cookie preferences in your browser settings.",
                    ),
                    policySection(
                      title: "3. How We Use Your Information",
                      content:
                      "We use your data to:\n- Provide and improve our services.\n- Process transactions and payments.\n- Send important updates and promotional emails (with your consent).\n- Enhance security and prevent fraud.\n- Analyze usage trends to improve user experience.",
                    ),
                    policySection(
                      title: "4. How We Share Your Information",
                      content:
                      "We do not sell your personal data. However, we may share your information with:\n- Service Providers: Payment processors, cloud storage providers, and analytics tools.\n- Legal Authorities: If required by law or to protect against fraud and security threats.\n- Business Transfers: In case of a merger, acquisition, or sale of assets.",
                    ),
                    policySection(
                      title: "5. Data Security",
                      content:
                      "We implement strict security measures to protect your data, including encryption, firewalls, and access controls. However, no method of data transmission is 100% secure.",
                    ),
                    policySection(
                      title: "6. Your Rights & Choices",
                      content:
                      "Depending on your location, you may have the right to:\n- Access, update, or delete your personal data.\n- Opt out of marketing communications.\n- Restrict or object to data processing.\n- Request a copy of your data.\nTo exercise your rights, contact us at [Your Support Email].",
                    ),
                    policySection(
                      title: "7. Third-Party Links & Services",
                      content:
                      "Our website/app may contain links to third-party sites. We are not responsible for their privacy practices. Please review their privacy policies before sharing your data.",
                    ),
                    policySection(
                      title: "8. Changes to This Policy",
                      content:
                      "We may update this policy from time to time. Any changes will be posted on this page.",
                    ),
                    policySection(
                      title: "9. Contact Us",
                      content:
                      "If you have any questions, please contact us.",
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget policySection({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
