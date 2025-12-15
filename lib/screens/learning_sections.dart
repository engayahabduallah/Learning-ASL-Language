import 'package:flutter/material.dart';

class SignLanguageSection {
  final String id;
  final String title;
  final String description;
  final int requiredPointsToUnlock;
  final IconData icon;
  final Color color;

  const SignLanguageSection({
    required this.id,
    required this.title,
    required this.description,
    this.requiredPointsToUnlock = 0,
    required this.icon,
    required this.color,
  });
}
const List<SignLanguageSection> availableSections = [
  SignLanguageSection(
    id: 'sec_1_alphabet', 
    title: '1. Alphabet (A-Z)',
    description: 'Master every letter for reading and spelling.',
    requiredPointsToUnlock: 0, 
    icon: Icons.sort_by_alpha,
    color: Color(0xFFE57373), 
  ),
  SignLanguageSection(
    id: 'sec_2_numbers', 
    title: '2. Numbers (0-10)',
    description: 'Practice counting and signing quantities.',
    requiredPointsToUnlock: 50, 
    icon: Icons.looks_one,
    color: Color(0xFF4FC3F7), 
  ),
  SignLanguageSection(
    id: 'sec_3_colors', 
    title: '3. Colors',
    description: 'Learn the signs for red, blue, green, and more.',
    requiredPointsToUnlock: 100, 
    icon: Icons.palette,
    color: Color(0xFFFFB74D), 
  ),
  SignLanguageSection(
    id: 'sec_4_phrases', 
    title: '4. Basic Phrases',
    description: 'Hello, Thank you, Please, and other essentials.',
    requiredPointsToUnlock: 150, 
    icon: Icons.chat_bubble,
    color: Color(0xFFAED581), 
  ),
  SignLanguageSection(
    id: 'sec_5_family', 
    title: '5. Family & People',
    description: 'Mother, Father, Friend, and basic people signs.',
    requiredPointsToUnlock: 200, 
    icon: Icons.family_restroom,
    color: Color(0xFFBA68C8), 
  ),
  SignLanguageSection(
    id: 'sec_6_animals', 
    title: '6. Animals',
    description: 'Dog, Cat, Bird, and more creatures.',
    requiredPointsToUnlock: 250, 
    icon: Icons.pets,
    color: Color(0xFF81C784),
  ),
  SignLanguageSection(
    id: 'sec_7_school', 
    title: '7. School',
    description: 'Signs for Teacher, Book, Read, and Write.',
    requiredPointsToUnlock: 300, 
    icon: Icons.school,
    color: Color(0xFFF06292), 
  ),
  SignLanguageSection(
    id: 'sec_8_food', 
    title: '8. Food',
    description: 'Signs for Water, Milk, Bread, and fruits.',
    requiredPointsToUnlock: 350, 
    icon: Icons.fastfood,
    color: Color(0xFF7986CB), 
  ),
];