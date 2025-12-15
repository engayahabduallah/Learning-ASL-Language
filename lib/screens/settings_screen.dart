import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  String _selectedLanguage = 'English'; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: const Color(0xFF0D47A1),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          _buildSettingsHeader("Notifications"),
          SwitchListTile(
            title: const Text('Enable Daily Reminders'),
            subtitle: const Text('Receive notifications to practice signing.'),
            secondary: const Icon(Icons.notifications_active, color: Color(0xFF0D47A1)),
            value: _notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),

          const Divider(),
          _buildSettingsHeader("Language Settings"),
          ListTile(
            title: const Text('Application Language'),
            leading: const Icon(Icons.language, color: Color(0xFF0D47A1)),
            trailing: DropdownButton<String>(
              value: _selectedLanguage,
              items: <String>['English', 'Arabic', 'Other']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLanguage = newValue!;
                });
              },
            ),
          ),
          
          const Divider(),
          _buildSettingsHeader("User Data"),
          ListTile(
            title: const Text('Reset Progress'),
            subtitle: const Text('Warning: This will clear all your points and achievements.'),
            leading: const Icon(Icons.delete_forever, color: Colors.red),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Progress reset functionality added here.")),
              );
            },
          ),
        ],
      ),
    );
  }
  Widget _buildSettingsHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0D47A1),
        ),
      ),
    );
  }
}