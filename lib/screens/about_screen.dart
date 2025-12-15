import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  static const Color primaryBlue = Color(0xFF0D47A1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Signly App"),
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: Column(
                children: [
                   Icon(
                    Icons.waving_hand,
                    size: 80,
                    color: primaryBlue,
                  ),
                   SizedBox(height: 10),
                   Text(
                    'Signly: Learn Sign Language',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: primaryBlue, 
                    ),
                  ),
                   Text('Version 1.0.0', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 30),
            _buildInfoSection(
              title: "Our Mission",
              content:
                  "Signly is dedicated to making Sign Language learning fun and  accessible for children. We aim to build inclusive communication skills through interactive lessons and a gamified learning approach.",
              icon: Icons.lightbulb_outline,
            ),
            const SizedBox(height: 20),
            _buildInfoSection(
              title: "Technology & Features",
              content:
                  "This application is built using the Flutter framework. It features video-based instruction, a reward system (Gamification) for progress, and a crucial Communication Guide (My Needs) for emergency use.",
              icon: Icons.code,
            ),
            const SizedBox(height: 20),
            _buildInfoSection(
              title: "Developer & Copyright",
              content:
                  "Developed by [Ayah Abduallah] as a university project. All content and design elements are created specifically for Signly. © 2026 Project Signly.",
              icon: Icons.copyright,
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildInfoSection({required String title, required String content, required IconData icon}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: primaryBlue),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryBlue,
                  ),
                ),
              ],
            ),
            const Divider(),
            Text(
              content,
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}
