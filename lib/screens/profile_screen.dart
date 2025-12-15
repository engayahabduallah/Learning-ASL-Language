import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:learning_asl_language/services/progress_service.dart';
import 'dart:io';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Helper to load image from either file path or asset
  ImageProvider _getImageProvider(String imagePath) {
    if (imagePath.startsWith('/')) {
      // It's a file path
      return FileImage(File(imagePath));
    } else {
      // It's an asset path
      return AssetImage(imagePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    final progressService = Provider.of<ProgressService>(context);
    final currentPoints = progressService.currentPoints;
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
        backgroundColor: const Color(0xFF0D47A1),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: _getImageProvider(progressService.userImagePath),
              radius: 60,
              child: progressService.userImagePath.isEmpty ? const Icon(Icons.person, size: 60) : null,
            ),
            const SizedBox(height: 15),
            Text(
              progressService.userName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text( 
              "Phone: ${progressService.userPhoneNumber}",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              "Email: ${progressService.userEmail}",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildStatRow(
                      icon: Icons.star, 
                      label: "Current Points:", 
                      value:progressService.currentPoints.toString(), 
                      color: Colors.amber,
                    ),
                    const Divider(),
                    _buildStatRow(
                      icon: Icons.check_circle, 
                      label: "Lessons Opened:", 
                      value: progressService.completedSections.length.toString(), 
                      color: Colors.green,
                    ),
                    const Divider(),
                    _buildStatRow(
                      icon: Icons.lock_open, 
                      label: "Sections Unlocked:", 
                      value: "${progressService.unlockedSectionsCount}/${progressService.totalSectionsCount}", 
                      color: Colors.lightBlue,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              "Progress Bar (Next Level):",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: currentPoints / 200, 
              backgroundColor: Colors.grey[300],
              color: const Color(0xFF0D47A1),
              minHeight: 10,
            ),
          ],
        ),
      ),
      
    );
  }

  Widget _buildStatRow({required IconData icon, required String label, required String value, required Color color}) {
    return Row(
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}