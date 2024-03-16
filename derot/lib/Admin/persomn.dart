// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

class NextShareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('פרסום דירה'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/share');
          },
        ),
      ),
      body: MultiImageInput(),
    );
  }
}

class MultiImageInput extends StatefulWidget {
  @override
  _MultiImageInputState createState() => _MultiImageInputState();
}

class _MultiImageInputState extends State<MultiImageInput> {
  List<File> _images = [];

  Future<void> _pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      setState(() {
        _images.add(File(image.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ElevatedButton(
          onPressed: () => _pickImage(ImageSource.camera),
          child: Text('צלם'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            minimumSize: Size(40, 40), // Set the minimum dimensions
          ),
        ),
        ElevatedButton(
          onPressed: () => _pickImage(ImageSource.gallery),
          child: Text('תמונה מגלריה'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            minimumSize: Size(40, 40), // Set the minimum dimensions
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: _images.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.file(_images[index]),
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/what');
          },
          child: Text(
            'שמור והמשך',
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            minimumSize: Size(50, 50), // Set the minimum dimensions
          ),
        ),
      ],
    );
  }
}
