import 'package:flutter/material.dart';
class MyNeed {
  final String id;
  final String title;
  final String imagePath;
  final Color color;

  MyNeed({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.color,
  });
}
final List<MyNeed> myNeedsData = [
  MyNeed(id: 'need_hungry', title: 'I am Hungry', imagePath: 'assets/images/Hungry.png', color: Colors.orange.shade200),
  MyNeed(id: 'need_thirsty', title: 'I am Thirsty', imagePath: 'assets/images/Thristy.png', color: Colors.blue.shade200),
  MyNeed(id: 'need_toilet', title: 'I need Toilet', imagePath: 'assets/images/Toilet.png', color: Colors.brown.shade200),
  MyNeed(id: 'need_help', title: 'I need Help', imagePath: 'assets/images/Help.png', color: Colors.red.shade200),
  MyNeed(id: 'need_play', title: 'I want to Play', imagePath: 'assets/images/Play.png', color: Colors.green.shade200),
  MyNeed(id: 'need_stop', title: 'Stop!', imagePath: 'assets/images/Stop!.png', color: Colors.deepPurple.shade200),
  MyNeed(id: 'need_yes', title: 'Yes!', imagePath: 'assets/images/Yes!.png', color: Colors.deepPurple.shade200),
  MyNeed(id: 'need_no', title: 'No!', imagePath: 'assets/images/No!.png', color: Colors.deepPurple.shade200),
];
class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Communication Guide"),
        backgroundColor: const Color(0xFF0D47A1),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Quick Communication (My Needs)",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D47A1),
              ),
            ),
            const Text(
              "Tap on the card to show a large image to quickly communicate your need to others.",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1,
              ),
              itemCount: myNeedsData.length,
              itemBuilder: (context, index) {
                final need = myNeedsData[index];
                return _buildNeedCard(context, need);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNeedCard(BuildContext context, MyNeed need) {
    return Card(
      color: need.color,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () => _showNeedPopup(context, need),
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Image.asset(
                  need.imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error_outline, size: 50, color: Colors.red);
                  },
                ),
              ),
              const SizedBox(height: 8),
              Text(
                need.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _showNeedPopup(BuildContext context, MyNeed need) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(), 
            child: Container(
              decoration: BoxDecoration(
                color: need.color,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF0D47A1), width: 5),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    need.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Image.asset(
                      need.imagePath,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(child: Text("Image not found", style: TextStyle(color: Colors.red)));
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Tap anywhere to close",
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}