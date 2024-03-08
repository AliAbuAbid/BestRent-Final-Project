// ignore_for_file: unused_import, unnecessary_import, unnecessary_cast, unused_local_variable

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePhoto extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePhoto();
  }
}

File? _image;

class _ProfilePhoto extends State<ProfilePhoto> {
  Future<void> TookImage() async {
    final userEmail = FirebaseAuth.instance.currentUser?.email;
    var userProfilePhoto;
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('users')
        .where('email', isEqualTo: userEmail)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      userProfilePhoto = querySnapshot.docs[0].data()['profilePhoto'];
      print('User profile photo: $userProfilePhoto');
    } else {
      print('No user found with the email: $userEmail');
    }

    print('\n\n\n\n\n\n$userProfilePhoto\n\n\n\n\n\n');
  }

  Future<void> _pickImage(ImageSource source) async {
    TookImage();
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (_image != null) {
      setState(() {
        _image;
      });
    } else if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        path = pickedFile.path as String;
        updateUser();
      });
    }
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  late String path;
  Future<void> updateUser() async {
    final userEmail = FirebaseAuth.instance.currentUser?.email;

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('users')
        .where('email', isEqualTo: userEmail)
        .get();

    String docsId = querySnapshot.docs.first.id;

    print('\n\n\n\n\n\nUser Id:  $docsId\n\n\n\n\n\n');
    return users
        .doc(docsId)
        .update({'profilePhoto': path})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> _showImagePickerOptions(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('60'.tr),
                onTap: () {
                  _pickImage(ImageSource.gallery);

                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('61'.tr),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('delet photo'.tr),
                onTap: () {
                  setState(() {
                    _image = null;
                    path = 'There is no  photo';

                    //TookImage();
                    updateUser();
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildImage() {
    if (_image != null) {
      return ClipOval(
        child: Image.file(
          _image!,
          width: 130,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Icon(
        Icons.add_a_photo,
        size: 50,
        color: Color.fromARGB(255, 0, 0, 0),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showImagePickerOptions(context),
      child: CircleAvatar(
        radius: 65,
        backgroundColor: Color.fromARGB(74, 220, 228, 236),
        child: _buildImage(),
      ),
    );
  }
}
