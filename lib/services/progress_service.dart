import 'package:flutter/foundation.dart';
import '../screens/learning_sections.dart'; 
// قد نحتاج مستقبلاً إلى: import 'package:shared_preferences/shared_preferences.dart';

class ProgressService extends ChangeNotifier {
  String userName = "Ayah Abdullah"; // يمكن استبدالها ببيانات المستخدم الحقيقية
  String _userEmail = "";
  String _userPhoneNumber = "";
  int _currentPoints = 0; 
  // تم استخدام قائمة من الـ Strings لسهولة الحفظ والتحميل
  final List<String> _completedSections = ['sec_1']; 
  String _currentLevel = 'Beginner';
  String _userImagePath = 'assets/images/user_profile.png';

  int get currentPoints => _currentPoints;
  List<String> get completedSections => _completedSections;
  String get currentLevel => _currentLevel;
  String get userImagePath => _userImagePath;
  String get userEmail => _userEmail;
  String get userPhoneNumber => _userPhoneNumber;
  
  // دالة لإضافة النقاط
  void addPoints(int points) {
    _currentPoints += points;
    _checkLevelUp();
    notifyListeners();
  }

  // دالة لإكمال القسم
  void completeSection(String sectionId) {
    if (!_completedSections.contains(sectionId)) {
      _completedSections.add(sectionId);
      // منح نقاط إضافية لإكمال القسم
      addPoints(30); 
      notifyListeners();
    }
  }

  // دالة للتحقق من فتح القسم
  bool isSectionUnlocked(SignLanguageSection section) {
    return _currentPoints >= section.requiredPointsToUnlock;
  }
  
  // دالة تحديث المستوى
  void _checkLevelUp() {
    if (_currentPoints >= 200) {
      _currentLevel = 'Expert';
    } else if (_currentPoints >= 100) {
      _currentLevel = 'Intermediate';
    } else {
      _currentLevel = 'Beginner';
    }
  }
  
  // الحصول على عدد الأقسام المفتوحة
  int get unlockedSectionsCount {
    return availableSections.where((s) => _currentPoints >= s.requiredPointsToUnlock).length;
  }
  
  // الحصول على عدد الأقسام المكتملة
  int get completedSectionsCount {
    return _completedSections.length;
  }
  
  // الحصول على عدد الأقسام المفتوحة والمكتملة
  int get totalSectionsCount {
    return availableSections.length;
  }

  // تحديث بيانات المستخدم القادمة من شاشة تسجيل الدخول
  void setUserProfile({String? name, String? email, String? phone, String? imagePath}) {
    if (name != null && name.isNotEmpty) {
      userName = name;
    }
    if (email != null && email.isNotEmpty) {
      _userEmail = email;
    }
    if (phone != null && phone.isNotEmpty) {
      _userPhoneNumber = phone;
    }
    if (imagePath != null && imagePath.isNotEmpty) {
      _userImagePath = imagePath;
    }
    notifyListeners();
  }
}
