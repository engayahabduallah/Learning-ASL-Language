import 'package:flutter/material.dart';

class GuidanceScreen extends StatelessWidget {
  const GuidanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learning Guidance"),
        backgroundColor: const Color(0xFF0D47A1),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "How to Use Signly",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D47A1),
              ),
            ),
            const SizedBox(height: 20),

            _buildGuidanceStep(
              stepNumber: 1,
              title: "The Learn Section (Home)",
              description:
                  "This is where the fun begins! Select any topic (Alphabet, Numbers, etc.) to start a lesson. You will see a video demonstrating the sign.",
              icon: Icons.home,
            ),
            _buildGuidanceStep(
              stepNumber: 2,
              title: "Practice and Check",
              description:
                  "Watch the sign, then try to imitate it yourself. Press the 'I Signed It! (Check)' button when you are done. The app will reward you with points and stars!",
              icon: Icons.star,
            ),
            _buildGuidanceStep(
              stepNumber: 3,
              title: "The Guide Section (My Needs)",
              description:
                  "If you need to communicate something quickly (like I'm hungry or I need help), go to the Guide tab in the bottom bar. Tap on the card to show a clear image to the person you are communicating with.",
              icon: Icons.help_center,
            ),
            _buildGuidanceStep(
              stepNumber: 4,
              title: "Track Your Progress",
              description:
                  "Check the Profile tab to see how many points you have collected and how many sections you have unlocked. Keep learning to be a Sign Language Master!",
              icon: Icons.account_circle,
            ),

            const SizedBox(height: 30),
            const Text(
              "Tips for Parents:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Encourage your child to practice daily and make it a game! Praise them for every point and star they earn.",
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGuidanceStep({
    required int stepNumber,
    required String title,
    required String description,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: const Color(0xFF0D47A1),
            child: Text('$stepNumber', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0D47A1),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}