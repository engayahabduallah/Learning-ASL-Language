import 'package:flutter/material.dart';

class AppBottomNavBar extends StatelessWidget {
  final VoidCallback onPrevious;
  final VoidCallback onHome;
  final VoidCallback onNext;

  const AppBottomNavBar({
    super.key,
    required this.onPrevious,
    required this.onHome,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F5F5),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildButton(Icons.arrow_back, "Previous", onPrevious),
          _buildButton(Icons.home, "Home", onHome),
          _buildButton(Icons.arrow_forward, "Next", onNext),
        ],
      ),
    );
  }

  Widget _buildButton(IconData icon, String label, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(label, style: const TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0D47A1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      ),
    );
  }
}
