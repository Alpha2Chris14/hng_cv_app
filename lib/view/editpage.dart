import 'package:flutter/material.dart';
import '../models/cv_data.dart';

class EditPage extends StatefulWidget {
  final CVData cvData;
  final Function(CVData) onSave;

  EditPage({required this.cvData, required this.onSave});

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController slackUsernameController = TextEditingController();
  TextEditingController gitHubHandleController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fullNameController.text = widget.cvData.fullName;
    slackUsernameController.text = widget.cvData.slackUsername;
    gitHubHandleController.text = widget.cvData.gitHubHandle;
    bioController.text = widget.cvData.bio;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit CV'),
      ),
      body: Container(
        height: screenHeight,
        padding: const EdgeInsets.all(16.0),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  controller: fullNameController,
                  decoration: InputDecoration(labelText: 'Full Name'),
                ),
                TextField(
                  controller: slackUsernameController,
                  decoration: InputDecoration(labelText: 'Slack Username'),
                ),
                TextField(
                  controller: gitHubHandleController,
                  decoration: InputDecoration(labelText: 'GitHub Handle'),
                ),
                Container(
                  height: 200,
                  child: TextField(
                    controller: bioController,
                    decoration: InputDecoration(labelText: 'Bio'),
                    maxLines: null,
                    maxLength: 2000,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Update CVData with new values
                    widget.cvData.fullName = fullNameController.text;
                    widget.cvData.slackUsername = slackUsernameController.text;
                    widget.cvData.gitHubHandle = gitHubHandleController.text;
                    widget.cvData.bio = bioController.text;

                    // Call the onSave callback to pass the updated data back to the homepage
                    widget.onSave(widget.cvData);

                    // Navigate back to the CV viewing screen
                    Navigator.pop(context);
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
