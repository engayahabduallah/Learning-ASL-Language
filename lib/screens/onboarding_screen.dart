import 'package:flutter/material.dart';
 const String kCharacterImagePath = 'assets/images/assets/images/Hello_Hand.png';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildCharacterWidget(),
              const SizedBox(height: 30),
              const Text(
                "Hello, Little Signer!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0D47A1),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              const Text(
                "I'm Signly, your friend! I will help you discover the beautiful world of Sign Language and communicate your needs easily. Ready to learn and collect stars?",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context, 
                    '/login', 
                    (route) => false 
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber, 
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Let\'s Start!',
                  style: TextStyle(
                    fontSize: 20, 
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildCharacterWidget() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xFFB3E5FC), 
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFF0D47A1), width: 3),
      ),
      child: ClipOval(
        child: Image.asset(
          kCharacterImagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.tag_faces,
              size: 100,
              color: Color(0xFF0D47A1),
            );
          },
        ),
      ),
    );
  }
}





