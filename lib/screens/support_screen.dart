import 'package:flutter/material.dart';
class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  static const Color primaryBlue = Color(0xFF0D47A1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Support & Feedback"),
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Need Help or Have Feedback?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: primaryBlue,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "We appreciate your comments! Please use one of the options below to contact us or report any issues you face.",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 30),
            _buildSupportOption(
              icon: Icons.bug_report,
              title: "Report a Bug",
              subtitle: "Found a mistake in a sign or a technical issue? Tell us.",
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Opening email app for bug report... (support@signlyapp.com)')),
                );
              },
            ),
            const Divider(),
            _buildSupportOption(
              icon: Icons.lightbulb,
              title: "Suggest a Feature",
              subtitle: "Help us improve Signly with your innovative ideas.",
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Opening feedback form...')),
                );
              },
            ),
            const Divider(),
            _buildSupportOption(
              icon: Icons.email,
              title: "Contact Via Email",
              subtitle: "Direct support: support@signlyapp.com",
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Email address copied!')),
                );
              },
            ),
            const Divider(),
            _buildSupportOption(
              icon: Icons.star_rate,
              title: "Rate Our App",
              subtitle: "Leave us a positive review on the store!",
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Redirecting to App Store/Play Store...')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildSupportOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: primaryBlue, size: 30),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}