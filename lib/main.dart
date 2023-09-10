import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './models/cv_data.dart';
import './view/homepage.dart';
import './view/editpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CVData cvData = CVData(
    fullName: 'Onyeka Christian',
    slackUsername: 'Chris14',
    gitHubHandle: 'Alpha2Chris14',
    bio:
        'A Web/Mobile Developer with more than 3 years’ experience in providing solutions with skill for building and implementing scalable solution. A highly resourceful and innovative developer with extensive experience with layout. Skilled in designing, developing and building accessible web based applications incorporating a range of technologies. Also possess great determination for improvement and learning new things. Over time I have got the chance to work with different technologies over time from Front-end technology like HTML, CSS, and JavaScript( including frameworks like React and Vue) to back-end technology such as PHP(using the Laravel framework most time) and mobile technology such as flutter, Relational databases like MySQL also some No SQL database. One of my major strengths is actually curiosity always wanting to know and learn new things and technology, It has actually helped most time because it has been able to improve my skill a lot.',
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(cvData: cvData),
        '/edit': (context) => EditPage(
              cvData: cvData,
              onSave: (updatedData) {
                // Update the CVData instance with the saved data
                setState(() {
                  cvData = updatedData;
                });
              },
            ),
      },
    );
  }
}
