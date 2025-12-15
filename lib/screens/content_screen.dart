import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/progress_service.dart';
import 'learning_sections.dart';
import 'section_detail_screen.dart'; 

class ContentScreen extends StatelessWidget {
  const ContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final progressService = Provider.of<ProgressService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learning Sections"),
        backgroundColor: const Color(0xFF0D47A1),
        foregroundColor: Colors.white,
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: _buildDrawer(context, progressService),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildProgressHeader(progressService),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(), 
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, 
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.9, 
              ),
              itemCount: availableSections.length,
              itemBuilder: (context, index) {
                final section = availableSections[index];
                final isLocked = section.requiredPointsToUnlock > progressService.currentPoints;
                
                return _buildSectionCard(
                  context,
                  section: section,
                  isLocked: isLocked,
                  currentPoints: progressService.currentPoints,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildProgressHeader(ProgressService progressService) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD), 
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 30),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Your Points:", style: TextStyle(fontSize: 14)),
                  Text(
                    '${progressService.currentPoints}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0D47A1)),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFF0D47A1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              'Level: ${progressService.currentLevel}',
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildSectionCard(
    BuildContext context, {
    required SignLanguageSection section,
    required bool isLocked,
    required int currentPoints,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: isLocked
            ? () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Locked! You need ${section.requiredPointsToUnlock} points to unlock this section.',
                    ),
                    backgroundColor: Colors.redAccent,
                  ),
                );
              }
            : () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SectionDetailScreen(
                      sectionName: section.title,
                      sectionId: section.id,
                      lessonIndex: 0,
                    ),
                  ),
                );
              },
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            color: isLocked ? Colors.grey[200] : section.color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      section.icon,
                      size: 40,
                      color: isLocked ? Colors.grey[600] : section.color,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      section.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isLocked ? Colors.grey[700] : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      section.description,
                      style: TextStyle(
                        fontSize: 12,
                        color: isLocked ? Colors.grey : Colors.black54,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              if (isLocked)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black54.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.lock, size: 50, color: Colors.white),
                          const SizedBox(height: 8),
                          Text(
                            'Needs ${section.requiredPointsToUnlock} Pts',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}







 Widget _buildDrawer(BuildContext context, ProgressService progressService) {
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

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(progressService.userName, style: const TextStyle(fontWeight: FontWeight.bold)),
            accountEmail: Text("Points: ${progressService.currentPoints}"),
            currentAccountPicture: CircleAvatar(
              radius: 30,
              backgroundImage: _getImageProvider(progressService.userImagePath),
              backgroundColor: Colors.white,
              child: const Icon(Icons.person, color: Color(0xFF0D47A1)),
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF0D47A1),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.lightbulb_outline, color: Colors.amber),
            title: const Text('Learning Guidance'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/guidance'); 
            },
          ),
          ListTile(
            leading: const Icon(Icons.info, color: Colors.blueGrey),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/about'); 
            },
          ),
          ListTile( 
            leading: const Icon(Icons.support_agent, color: Colors.green),
            title: const Text('Support & Feedback'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/support'); 
            },
          ),
          ListTile( 
            leading: const Icon(Icons.settings, color: Colors.grey),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/settings'); 
            },
          ),

          const Divider(),
          ListTile( 
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            },
          ),
        ],
      ),
    );
  }



