import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import '../services/progress_service.dart';

class Lesson {
  final String title;
  final String signPath; 
  final bool isVideo;    
  final String wordToGuess; 

  Lesson({
    required this.title,
    required this.signPath,
    required this.isVideo,
    required this.wordToGuess,
  });
}
final Map<String, List<Lesson>> lessonData = {
  'sec_1_alphabet': [
    Lesson(title: 'Letter A', signPath: 'assets/videos/A.mp4', isVideo: true, wordToGuess: 'A'),
    Lesson(title: 'Letter B', signPath: 'assets/videos/B.mp4', isVideo: true, wordToGuess: 'B'),
    Lesson(title: 'Letter C', signPath: 'assets/videos/C.mp4', isVideo: true, wordToGuess: 'C'),
    Lesson(title: 'Letter D', signPath: 'assets/videos/D.mp4', isVideo: true, wordToGuess: 'D'),
    Lesson(title: 'Letter E', signPath: 'assets/videos/E.mp4', isVideo: true, wordToGuess: 'E'),
    Lesson(title: 'Letter F', signPath: 'assets/videos/F.mp4', isVideo: true, wordToGuess: 'F'),
    Lesson(title: 'Letter G', signPath: 'assets/videos/G.mp4', isVideo: true, wordToGuess: 'G'),
    Lesson(title: 'Letter H', signPath: 'assets/videos/H.mp4', isVideo: true, wordToGuess: 'H'),
    Lesson(title: 'Letter I', signPath: 'assets/videos/I.mp4', isVideo: true, wordToGuess: 'I'),
    Lesson(title: 'Letter J', signPath: 'assets/videos/J.mp4', isVideo: true, wordToGuess: 'J'),
    Lesson(title: 'Letter K', signPath: 'assets/videos/K.mp4', isVideo: true, wordToGuess: 'K'),
    Lesson(title: 'Letter L', signPath: 'assets/videos/L.mp4', isVideo: true, wordToGuess: 'L'),
    Lesson(title: 'Letter M', signPath: 'assets/videos/M.mp4', isVideo: true, wordToGuess: 'M'),
    Lesson(title: 'Letter N', signPath: 'assets/videos/N.mp4', isVideo: true, wordToGuess: 'N'),
    Lesson(title: 'Letter O', signPath: 'assets/videos/O.mp4', isVideo: true, wordToGuess: 'O'),
    Lesson(title: 'Letter P', signPath: 'assets/videos/P.mp4', isVideo: true, wordToGuess: 'P'),
    Lesson(title: 'Letter Q', signPath: 'assets/videos/Q.mp4', isVideo: true, wordToGuess: 'Q'),
    Lesson(title: 'Letter R', signPath: 'assets/videos/R.mp4', isVideo: true, wordToGuess: 'R'),
    Lesson(title: 'Letter S', signPath: 'assets/videos/S.mp4', isVideo: true, wordToGuess: 'S'),
    Lesson(title: 'Letter T', signPath: 'assets/videos/T.mp4', isVideo: true, wordToGuess: 'T'),
    Lesson(title: 'Letter U', signPath: 'assets/videos/U.mp4', isVideo: true, wordToGuess: 'U'),
    Lesson(title: 'Letter V', signPath: 'assets/videos/V.mp4', isVideo: true, wordToGuess: 'V'),
    Lesson(title: 'Letter W', signPath: 'assets/videos/W.mp4', isVideo: true, wordToGuess: 'W'),
    Lesson(title: 'Letter X', signPath: 'assets/videos/X.mp4', isVideo: true, wordToGuess: 'X'),
    Lesson(title: 'Letter Y', signPath: 'assets/videos/Y.mp4', isVideo: true, wordToGuess: 'Y'),
    Lesson(title: 'Letter Z', signPath: 'assets/videos/Z.mp4', isVideo: true, wordToGuess: 'Z'),
  ],
  'sec_2_numbers': [
    Lesson(title: 'Number 0', signPath: 'assets/videos/Zero.mp4', isVideo: true, wordToGuess: '0'),
    Lesson(title: 'Number 1', signPath: 'assets/videos/1.mp4', isVideo: true, wordToGuess: '1'),
    Lesson(title: 'Number 2', signPath: 'assets/videos/2.mp4', isVideo: true, wordToGuess: '2'),
    Lesson(title: 'Number 3', signPath: 'assets/videos/2.mp4', isVideo: true, wordToGuess: '3'),
    Lesson(title: 'Number 4', signPath: 'assets/videos/2.mp4', isVideo: true, wordToGuess: '4'),
    Lesson(title: 'Number 5', signPath: 'assets/videos/2.mp4', isVideo: true, wordToGuess: '5'),
    Lesson(title: 'Number 6', signPath: 'assets/videos/2.mp4', isVideo: true, wordToGuess: '6'),
    Lesson(title: 'Number 7', signPath: 'assets/videos/2.mp4', isVideo: true, wordToGuess: '7'),
    Lesson(title: 'Number 8', signPath: 'assets/videos/2.mp4', isVideo: true, wordToGuess: '8'),
    Lesson(title: 'Number 9', signPath: 'assets/videos/2.mp4', isVideo: true, wordToGuess: '9'),
    Lesson(title: 'Number 10', signPath: 'assets/videos/2.mp4', isVideo: true, wordToGuess: '10'),
  ],
  'sec_3_colors': [
    Lesson(title: 'Colors', signPath: 'assets/videos/Colors.mp4', isVideo: true, wordToGuess: 'Colors'),
    Lesson(title: 'White', signPath: 'assets/videos/White.mp4', isVideo: true, wordToGuess: 'White'),
    Lesson(title: 'Red', signPath: 'assets/videos/Red.mp4', isVideo: true, wordToGuess: 'Red'),
    Lesson(title: 'Blue', signPath: 'assets/videos/Blue.mp4', isVideo: true, wordToGuess: 'Blue'),
    Lesson(title: 'Black', signPath: 'assets/videos/Black.mp4', isVideo: true, wordToGuess: 'Black'),
    Lesson(title: 'Brown', signPath: 'assets/videos/Brown.mp4', isVideo: true, wordToGuess: 'Brown'),
    Lesson(title: 'Gray', signPath: 'assets/videos/Gray.mp4', isVideo: true, wordToGuess: 'Gray'),
    Lesson(title: 'Green', signPath: 'assets/videos/Green.mp4', isVideo: true, wordToGuess: 'Green'),
    Lesson(title: 'Orange', signPath: 'assets/videos/Orange.mp4', isVideo: true, wordToGuess: 'Orange'),
    Lesson(title: 'Pink', signPath: 'assets/videos/Pink.mp4', isVideo: true, wordToGuess: 'Pink'),
    Lesson(title: 'Red', signPath: 'assets/videos/Red.mp4', isVideo: true, wordToGuess: 'Red'),
    Lesson(title: 'Purple', signPath: 'assets/videos/Purple.mp4', isVideo: true, wordToGuess: 'Purple'),
    Lesson(title: 'Yellow', signPath: 'assets/videos/Yellow.mp4', isVideo: true, wordToGuess: 'Yellow'),
  ],
  'sec_4_phrases': [
    Lesson(title: 'Hello', signPath: 'assets/videos/Hello.mp4', isVideo: true, wordToGuess: 'Hello'),
    Lesson(title: 'Thank You', signPath: 'assets/videos/Thank_You.mp4', isVideo: true, wordToGuess: 'Thank You'),
    Lesson(title: 'Exuce Me', signPath: 'assets/videos/Exuce Me.mp4', isVideo: true, wordToGuess: 'Exuce Me'),
    Lesson(title: 'Sorry', signPath: 'assets/videos/Sorry.mp4', isVideo: true, wordToGuess: 'Sorry'),
    Lesson(title: 'Please', signPath: 'assets/videos/Please.mp4', isVideo: true, wordToGuess: 'Please'),
    Lesson(title: 'Yes', signPath: 'assets/videos/Yes.mp4', isVideo: true, wordToGuess: 'Yes'),
    Lesson(title: 'No', signPath: 'assets/videos/No.mp4', isVideo: true, wordToGuess: 'No'),
    Lesson(title: 'I luv u', signPath: 'assets/videos/I luv u.mp4', isVideo: true, wordToGuess: 'I luv u'),
    Lesson(title: 'Good Bye', signPath: 'assets/videos/Good Bye.mp4', isVideo: true, wordToGuess: 'Good Bye'),
    Lesson(title: 'Good Morning', signPath: 'assets/videos/Good Morning.mp4', isVideo: true, wordToGuess: 'Good Morning'),
  ],
  'sec_5_family': [
    Lesson(title: 'Mother', signPath: 'assets/videos/Mother.mp4', isVideo: true, wordToGuess: 'Mother'),
    Lesson(title: 'Father', signPath: 'assets/videos/Father.mp4', isVideo: true, wordToGuess: 'Father'),
    Lesson(title: 'Family', signPath: 'assets/videos/Family.mp4', isVideo: true, wordToGuess: 'Family'),
    Lesson(title: 'Brother', signPath: 'assets/videos/Brother.mp4', isVideo: true, wordToGuess: 'Brother'),
    Lesson(title: 'Friend', signPath: 'assets/videos/Friend.mp4', isVideo: true, wordToGuess: 'Friend'),
    Lesson(title: 'Sister', signPath: 'assets/videos/Sister.mp4', isVideo: true, wordToGuess: 'Sister'),
    Lesson(title: 'Grandma', signPath: 'assets/videos/Grandma.mp4', isVideo: true, wordToGuess: 'Grandma'),
    Lesson(title: 'Grandpa', signPath: 'assets/videos/Grandpa.mp4', isVideo: true, wordToGuess: 'Grandpa'),
    Lesson(title: 'Baby', signPath: 'assets/videos/Baby.mp4', isVideo: true, wordToGuess: 'Baby'),
  ],
  'sec_6_animals': [
    Lesson(title: 'Animals', signPath: 'assets/videos/Animals.mp4', isVideo: true, wordToGuess: 'Animals'),
    Lesson(title: 'Dog', signPath: 'assets/videos/Dog.mp4', isVideo: true, wordToGuess: 'Dog'),
    Lesson(title: 'Cat', signPath: 'assets/videos/Cat.mp4', isVideo: true, wordToGuess: 'Cat'),
    Lesson(title: 'Bird', signPath: 'assets/videos/Bird.mp4', isVideo: true, wordToGuess: 'Bird'),
    Lesson(title: 'Fish', signPath: 'assets/videos/Fish.mp4', isVideo: true, wordToGuess: 'Fish'),
    Lesson(title: 'Horse', signPath: 'assets/videos/Horse.mp4', isVideo: true, wordToGuess: 'Horse'),
    Lesson(title: 'Monkey', signPath: 'assets/videos/Monkey.mp4', isVideo: true, wordToGuess: 'Monkey'),
    Lesson(title: 'Sheep', signPath: 'assets/videos/Sheep.mp4', isVideo: true, wordToGuess: 'Sheep'),
    Lesson(title: 'Lion', signPath: 'assets/videos/Lion.mp4', isVideo: true, wordToGuess: 'Lion'),
    Lesson(title: 'Elephant', signPath: 'assets/videos/Elephant.mp4', isVideo: true, wordToGuess: 'Elephant'),
    Lesson(title: 'Cow', signPath: 'assets/videos/Cow.mp4', isVideo: true, wordToGuess: 'Cow'),
  ],
  'sec_7_school': [
    Lesson(title: 'School', signPath: 'assets/videos/School.mp4', isVideo: true, wordToGuess: 'School'),
    Lesson(title: 'Teacher', signPath: 'assets/videos/Teacher.mp4', isVideo: true, wordToGuess: 'Teacher'),
    Lesson(title: 'Book', signPath: 'assets/videos/Book.mp4', isVideo: true, wordToGuess: 'Book'),
    Lesson(title: 'Student', signPath: 'assets/videos/Student.mp4', isVideo: true, wordToGuess: 'Student'),
    Lesson(title: 'Class', signPath: 'assets/videos/Class.mp4', isVideo: true, wordToGuess: 'Class'),
    Lesson(title: 'Pen', signPath: 'assets/videos/Pen.mp4', isVideo: true, wordToGuess: 'Pen'),
    Lesson(title: 'Homework', signPath: 'assets/videos/Homework.mp4', isVideo: true, wordToGuess: 'Homework'),
    Lesson(title: 'Read', signPath: 'assets/videos/Read.mp4', isVideo: true, wordToGuess: 'Read'),
    Lesson(title: 'Write', signPath: 'assets/videos/Write.mp4', isVideo: true, wordToGuess: 'Write'),
  ],
  'sec_8_food': [
    Lesson(title: 'Food', signPath: 'assets/videos/Food.mp4', isVideo: true, wordToGuess: 'Food'),
    Lesson(title: 'Water', signPath: 'assets/videos/Water.mp4', isVideo: true, wordToGuess: 'Water'),
    Lesson(title: 'Milk', signPath: 'assets/videos/Milk.mp4', isVideo: true, wordToGuess: 'Milk'),
    Lesson(title: 'Tomato', signPath: 'assets/videos/Tomato.mp4', isVideo: true, wordToGuess: 'Tomato'),
    Lesson(title: 'Rice', signPath: 'assets/videos/Rice.mp4', isVideo: true, wordToGuess: 'Rice'),
    Lesson(title: 'Meat', signPath: 'assets/videos/Meat.mp4', isVideo: true, wordToGuess: 'Meat'),
    Lesson(title: 'Orange', signPath: 'assets/videos/Food Orange.mp4', isVideo: true, wordToGuess: 'Orange'),
    Lesson(title: 'Chicken', signPath: 'assets/videos/Chicken.mp4', isVideo: true, wordToGuess: 'Chicken'),
    Lesson(title: 'Banana', signPath: 'assets/videos/Banana.mp4', isVideo: true, wordToGuess: 'Banana'),
    Lesson(title: 'Apple', signPath: 'assets/videos/Apple.mp4', isVideo: true, wordToGuess: 'Apple'),
  ],
};
class SectionDetailScreen extends StatefulWidget {
  final String sectionName;
  final String sectionId;
  final int lessonIndex;

  const SectionDetailScreen({
    super.key,
    required this.sectionName,
    required this.sectionId,
    required this.lessonIndex,
  });

  @override
  State<SectionDetailScreen> createState() => _SectionDetailScreenState();
}

class _SectionDetailScreenState extends State<SectionDetailScreen> {
  VideoPlayerController? _videoController;
  List<Lesson> _lessons = [];
  int _currentLessonIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentLessonIndex = widget.lessonIndex;
    _lessons = lessonData[widget.sectionId] ?? []; 

    if (_lessons.isNotEmpty) {
      _initializeMedia(_lessons[_currentLessonIndex]);
    }
  }

  void _initializeMedia(Lesson lesson) {
    if (lesson.isVideo) {
      _videoController?.dispose();
      _videoController = VideoPlayerController.asset(lesson.signPath)
        ..initialize().then((_) {
          setState(() {}); 
          _videoController!.play();
          _videoController!.setLooping(true);
        }).catchError((error) {
          debugPrint("Error loading video: ${error.toString()} for path: ${lesson.signPath}");
          setState(() {
            _videoController = null;
          });
        });
    } else {
      _videoController?.pause();
      setState(() {});
    }
  }

  void _goToNextLesson(BuildContext context) {
    if (_currentLessonIndex < _lessons.length - 1) {
      setState(() {
        _currentLessonIndex++;
        _initializeMedia(_lessons[_currentLessonIndex]);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Congratulations! You completed this section!')),
      );
      Navigator.pop(context); 
    }
  }
  
  void _goToPreviousLesson() {
    if (_currentLessonIndex > 0) {
      setState(() {
        _currentLessonIndex--;
        _initializeMedia(_lessons[_currentLessonIndex]);
      });
    }
  }

  void _checkSign(BuildContext context) {
    Provider.of<ProgressService>(context, listen: false).addPoints(10); 

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Great job! You earned 10 points and a star!'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );

    Future.delayed(const Duration(milliseconds: 500), () {
      _goToNextLesson(context);
    });
  }


  @override
  Widget build(BuildContext context) {
    if (_lessons.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.sectionName)),
        body: const Center(child: Text('No lessons found for this section.')),
      );
    }
    
    final currentLesson = _lessons[_currentLessonIndex];
    final isLastLesson = _currentLessonIndex == _lessons.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.sectionName),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                currentLesson.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0D47A1),
                ),
              ),
              const SizedBox(height: 20),
              _buildMediaDisplay(currentLesson),
              const SizedBox(height: 30),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        "Sign this word:",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        currentLesson.wordToGuess.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => _checkSign(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber, 
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'I Signed It! (Check)',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.home),
                    label: const Text('Home'),
                  ),
                  TextButton.icon(
                    onPressed: _currentLessonIndex > 0 ? _goToPreviousLesson : null,
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Previous'),
                  ),
                  TextButton.icon(
                    onPressed: isLastLesson ? null : () => _goToNextLesson(context),
                    icon: Icon(isLastLesson ? Icons.check : Icons.arrow_forward),
                    label: Text(isLastLesson ? 'Finish' : 'Next'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMediaDisplay(Lesson lesson) {
    final mediaWidth = MediaQuery.of(context).size.width * 0.8;

    if (lesson.isVideo) {
      if (_videoController != null && _videoController!.value.isInitialized) {
        return AspectRatio(

          key: ValueKey(_videoController!.value.aspectRatio),
          aspectRatio: 1,
          child: VideoPlayer(_videoController!),
        );
      } else {
        return Container(
          width: mediaWidth,
          height: mediaWidth * 0.75, 
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(color: Color(0xFF0D47A1)),
                const SizedBox(height: 10),
                Text('Loading Video: ${lesson.signPath}', style: const TextStyle(color: Color(0xFF0D47A1))),
              ],
            ),
          ),
        );
      }
    } else {
      return Container(
        alignment: Alignment.center,
        child: Image.asset(
          lesson.signPath,
          width: mediaWidth,
          height: mediaWidth * 0.75,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.image_not_supported,
              size: 100,
              color: Colors.red,
            );
          },
        ),
      );
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }
}
