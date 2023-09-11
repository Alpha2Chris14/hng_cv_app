import 'package:flutter/material.dart';
import 'package:hng_cv_app/view/editpage.dart';
import '../models/cv_data.dart';

class HomePage extends StatefulWidget {
  final CVData cvData;

  HomePage({required this.cvData});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('CVApp'),
      ),
      body: Center(
        child: Container(
          height: screenHeight,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Text(
                'Full Name: ${widget.cvData.fullName}',
                style: const TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Text(
                'Slack Username: ${widget.cvData.slackUsername}',
                style: const TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Text(
                'GitHub Handle: ${widget.cvData.gitHubHandle}',
                style: const TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Bio: ",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    '${widget.cvData.bio}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the editing page
                  Navigator.pushNamed(context, '/edit');
                },
                child: Text('Edit CV'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
