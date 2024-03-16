// // // ignore_for_file: unused_local_variable, unused_import, unused_field

// ignore_for_file: unused_field, unused_import, duplicate_ignore, deprecated_member_use, unused_element, unused_local_variable

import 'dart:core';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:derot/DataBase/Transition.dart';
import 'package:derot/HouseRent/ApartmentIcons.dart';
import 'package:derot/Admin/whatIn.dart';
import 'package:derot/HouseRent/myHouses.dart';
//import 'package:derot/HouseRent/fechingData.dart';
import 'package:derot/Users/login.dart';
import 'package:derot/main.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
//import 'package:derot/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
// ignore: unused_import
import 'package:validators/validators.dart';

class AddHouse extends StatefulWidget {
  const AddHouse({Key? key}) : super(key: key);

  @override
  State<AddHouse> createState() => _AddHouse();
}

class _AddHouse extends State<AddHouse> {
  final _formKey = GlobalKey<FormState>();
  Kind _selectedhouse = Kind.partners;
  States _selectedstate = States.center;
  TextEditingController _cityController = TextEditingController();
  final _streetController = TextEditingController();
  final _streetnController = TextEditingController();
  final _expController = TextEditingController();
  final _building = TextEditingController();
  final _floar = TextEditingController();
  final _rooms = TextEditingController();
  final _price = TextEditingController();
  int documentCount = 0;

  String userEmail = '';
  String userPhone = '';
  String userFullname = '';

  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isChecked4 = false;
  bool _isChecked5 = false;
  bool _isChecked6 = false;
  bool _isChecked7 = false;
  bool _isChecked8 = false;
  bool _isChecked9 = false;
  bool _isChecked10 = false;
  bool _isChecked11 = false;
  bool _isChecked12 = false;

  //Kind house;
  List<String> downloadUrls = [];
  List<File> _images = [];
  bool x = false;
  late String document;
  int k = 0;
  DateTime currentDate = DateTime.now();
  //String formattedDate = currentDate.toString();
  //'${currentDate.year}-${currentDate.month}-${currentDate.day}';

  int? selectedImage;

  Future<void> _pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      setState(() {
        _images.add(File(image.path));
      });
    }
  }

  void _add() async {
    // if (_formKey.currentState!.validate()) {
    String userPhone = '';
    String userFullname = '';
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      //User? user = FirebaseAuth.instance.currentUser;
      final userEmail = FirebaseAuth.instance.currentUser?.email;
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .where('email', isEqualTo: userEmail)
              .get();
      if (querySnapshot.docs.isNotEmpty) {
        userPhone = querySnapshot.docs[0].data()['phone'];
        userFullname = querySnapshot.docs[0].data()['username'];
        //print('User profile photo: $userProfilePhoto');
      } else {
        print('No user found with the email: $userEmail');
      }
      document = querySnapshot.docs[0].id.toString();
      print('\n\n\n This is my Document id: $document');

      for (File image in _images) {
        String downloadUrl = image.path;
        downloadUrls.add(downloadUrl);
      }
      QuerySnapshot<Map<String, dynamic>> snapshott =
          await FirebaseFirestore.instance.collection('apartments').get();
      k = snapshott.docs.length + 1;
      //k = totalCount;

      print('\nNumber of documents: $k');
      await firestore.collection('apartments').add({
        'email': userEmail,
        'phone': userPhone,
        'username': userFullname,
        'house': _selectedhouse.toString(),
        'district': _selectedstate.toString(),
        'city': _cityController.text,
        'street': _streetController.text,
        'building': _building.text,
        'floar': _floar.text,
        'rooms': _rooms.text,
        'price': _price.text,
        'streetNumber': _streetnController.text,
        'explain': _expController.text,
        'ExclusiveProperty': _isChecked1,
        'AirCondition': _isChecked2,
        'Bars': _isChecked3,
        'Heater': _isChecked4,
        'AccessForDisabled': _isChecked5,
        'Renovated': _isChecked6,
        'Shelter': _isChecked7,
        'Storage': _isChecked8,
        'Pets': _isChecked9,
        'Furniture': _isChecked10,
        'flexible': _isChecked11,
        'LongTerm': _isChecked12,
        'postedDate': DateFormat('dd/MM/yyyy').format(currentDate),

        // 'index': snapshott.docs.length + 1,
        // 'Images':
        //     FieldValue.arrayUnion(downloadUrls), //_images.toList().toString(),
      });

      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('apartments')
          .where('email', isEqualTo: userEmail)
          .where('phone', isEqualTo: userPhone)
          .where('username', isEqualTo: userFullname)
          .where('house', isEqualTo: _selectedhouse.toString())
          .where('district', isEqualTo: _selectedstate.toString())
          .where('city', isEqualTo: _cityController.text)
          .where('street', isEqualTo: _streetController.text)
          .where('building', isEqualTo: _building.text)
          .where('floar', isEqualTo: _floar.text)
          .where('rooms', isEqualTo: _rooms.text)
          .where('price', isEqualTo: _price.text)
          .where('streetNumber', isEqualTo: _streetnController.text)
          .where('explain', isEqualTo: _expController.text)
          .where('ExclusiveProperty', isEqualTo: _isChecked1)
          .where('AirCondition', isEqualTo: _isChecked2)
          .where('Bars', isEqualTo: _isChecked3)
          .where('Heater', isEqualTo: _isChecked4)
          .where('AccessForDisabled', isEqualTo: _isChecked5)
          .where('Renovated', isEqualTo: _isChecked6)
          .where('Shelter', isEqualTo: _isChecked7)
          .where('Storage', isEqualTo: _isChecked8)
          .where('Pets', isEqualTo: _isChecked9)
          .where('Furniture', isEqualTo: _isChecked10)
          .where('flexible', isEqualTo: _isChecked11)
          .where('LongTerm', isEqualTo: _isChecked12)
          .get();

      documents = snapshot.docs[0].id.toString();

      print('\n\n\n This is my Apartments Document id: $documents');
      _uploadImagesToFirebaseStorage();
      Navigator.of(context).push(CustomPageRoute(
        pageBuilder: (context) => MyHouse(),
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('81'.tr)),
        );
        print('81'.tr);
      }
    } catch (e) {
      print(e);
    }
    //}
  }

  Future<void> _uploadImagesToFirebaseStorage() async {
    print('This is my best rrrdocument $documents');
    for (int i = 0; i < _images.length; i++) {
      try {
        File imageFile = _images[i];
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();

        // Create a reference to the location you want to upload to in Firebase Storage
        Reference storageReference = FirebaseStorage.instance
            .ref()
            .child('images/$documents/$fileName.jpg');

        // Upload the file to Firebase Storage
        UploadTask uploadTask = storageReference.putFile(imageFile);

        // Wait for the upload task to complete and fetch the download URL
        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
        String downloadUrl = await taskSnapshot.ref.getDownloadURL();

        // Print the download URL for the uploaded image
        print('Download URL for Image $i: $k');
      } catch (error) {
        print('Error uploading image $i: $error');
      }
    }
  }

  Widget buildCheckboxItem(String title, bool value) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.start,
      //crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Checkbox(
          value: value,
          onChanged: (bool? newValue) {
            setState(() {
              if (title == '88'.tr) _isChecked1 = newValue!;
              if (title == '89'.tr) _isChecked2 = newValue!;
              if (title == '90'.tr) _isChecked3 = newValue!;
              if (title == '91'.tr) _isChecked4 = newValue!;
              if (title == '92'.tr) _isChecked5 = newValue!;
              if (title == '93'.tr) _isChecked6 = newValue!;
              if (title == '94'.tr) _isChecked7 = newValue!;
              if (title == '95'.tr) _isChecked8 = newValue!;
              if (title == '96'.tr) _isChecked9 = newValue!;
              if (title == '97'.tr) _isChecked10 = newValue!;
              if (title == '98'.tr) _isChecked11 = newValue!;
              if (title == '99'.tr) _isChecked12 = newValue!;
            });
          },
        ),
        Text(title),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/apartments.jpg',
            ),
            fit: BoxFit.cover,
            opacity: 0.3,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppBar(
                        backgroundColor:
                            Colors.transparent, // Make app bar transparent
                        elevation: 0, // Remove app bar shadow
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.all(32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //padding: EdgeInsets.only(left: 120),
                            //SizedBox(width: 10),
                            Text(
                              '40'.tr,
                              style: GoogleFonts.lato(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            // Spacer(),
                            SizedBox(height: 10),
                            DropdownButton(
                                value: _selectedhouse,
                                items: Kind.values
                                    .map(
                                      (lang) => DropdownMenuItem(
                                        value: lang,
                                        child: Text(
                                          lang.kindValue.toString(),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  if (value == null) {
                                    return;
                                  }
                                  setState(() {
                                    _selectedhouse = value;
                                  });
                                }),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 32),
                            //padding: EdgeInsets.only(left: 120),
                            Text(
                              '41'.tr,
                              style: GoogleFonts.lato(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10),
                            DropdownButton(
                                value: _selectedstate,
                                items: States.values
                                    .map(
                                      (lang) => DropdownMenuItem(
                                        value: lang,
                                        child: Text(
                                          lang.statesValue.toString(),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  if (value == null) {
                                    return;
                                  }
                                  setState(() {
                                    _selectedstate = value;
                                  });
                                }),
                            SizedBox(height: 10),
                          ],
                        ),
                        Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(height: 32),
                                Container(
                                  //textDirection: TextDirection.rtl,
                                  child: TextField(
                                    controller: _cityController,
                                    textAlign: TextAlign
                                        .left, // Align the label text to the right

                                    decoration:
                                        InputDecoration(labelText: '34'.tr),
                                  ),
                                ),
                                SizedBox(height: 32),
                                Container(
                                  // textDirection: TextDirection.rtl,
                                  child: TextField(
                                    controller: _streetController,
                                    textAlign: TextAlign
                                        .left, // Align the label text to the right
                                    decoration:
                                        InputDecoration(labelText: '35'.tr),
                                  ),
                                ),
                                SizedBox(height: 32),
                                Container(
                                  //textDirection: TextDirection.rtl,
                                  child: TextField(
                                    controller: _streetnController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      label: Text('42'.tr),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 32),
                                Container(
                                  //textDirection: TextDirection.rtl,
                                  child: TextField(
                                    controller: _building,
                                    decoration: InputDecoration(
                                      label: Text('104'.tr),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 32),

                                Container(
                                  //textDirection: TextDirection.rtl,
                                  child: TextField(
                                    controller: _rooms,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      label: Text('31'.tr),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 32),
                                Container(
                                  //textDirection: TextDirection.rtl,
                                  child: TextField(
                                    controller: _floar,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      label: Text('109'.tr + ':'),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 32),
                                Container(
                                  //textDirection: TextDirection.rtl,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: _price,
                                    decoration: InputDecoration(
                                      label: Text('30'.tr),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 32),
                                Container(
                                  //textDirection: TextDirection.rtl,
                                  child: TextField(
                                    maxLines: null,
                                    controller: _expController,
                                    textAlign: TextAlign
                                        .left, // Align the label text to the right
                                    decoration:
                                        InputDecoration(labelText: '39'.tr),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          buildCheckboxItem(
                                            '88'.tr,
                                            _isChecked1,
                                          ),
                                          buildCheckboxItem(
                                              '89'.tr, _isChecked2),
                                          buildCheckboxItem(
                                              '90'.tr, _isChecked3),
                                          buildCheckboxItem(
                                              '91'.tr, _isChecked4),
                                          buildCheckboxItem(
                                              '92'.tr, _isChecked5),
                                          buildCheckboxItem(
                                              '93'.tr, _isChecked6),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          buildCheckboxItem(
                                              '94'.tr, _isChecked7),
                                          buildCheckboxItem(
                                              '95'.tr, _isChecked8),
                                          buildCheckboxItem(
                                              '96'.tr, _isChecked9),
                                          buildCheckboxItem(
                                              '97'.tr, _isChecked10),
                                          buildCheckboxItem(
                                              '98'.tr, _isChecked11),
                                          buildCheckboxItem(
                                              '99'.tr, _isChecked12),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 32),

                                ElevatedButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        x = true;

                                        return Container(
                                          padding: EdgeInsets.all(16),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              ListTile(
                                                leading:
                                                    Icon(Icons.photo_library),
                                                title: Text('60'.tr),
                                                onTap: () {
                                                  _pickImage(
                                                      ImageSource.gallery);

                                                  Navigator.pop(context);
                                                },
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.camera_alt),
                                                title: Text('61'.tr),
                                                onTap: () {
                                                  _pickImage(
                                                      ImageSource.camera);
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    '100'.tr,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    // primary: Colors.teal,
                                    side: const BorderSide(
                                        color: Color.fromARGB(121, 0, 0, 0),
                                        width: 2.0),
                                    minimumSize: Size(40, 40),
                                  ),
                                ),
                                // SizedBox(height: 20),

                                Container(
                                  height: x ? 300 : 10,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: List.generate(
                                      _images.length,
                                      (index) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Container(
                                          //width: 150, // Set the desired width
                                          height: 90, // Set the desired height
                                          child: TextButton(
                                            onPressed: () {},
                                            onLongPress: () {
                                              showModalBottomSheet(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: <Widget>[
                                                      ListTile(
                                                        leading:
                                                            Icon(Icons.delete),
                                                        title: Text('105'.tr),
                                                        onTap: () {
                                                          setState(() {
                                                            x = false;
                                                            if (_images
                                                                .isNotEmpty) {
                                                              _images.removeAt(
                                                                  index); // Remove the image at the given index
                                                            }
                                                          });
                                                          Navigator.pop(
                                                              context); // Close the bottom sheet
                                                        },
                                                      ),
                                                      ListTile(
                                                        leading:
                                                            Icon(Icons.cancel),
                                                        title: Text('Cancel'),
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context); // Close the bottom sheet
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Image.file(
                                              _images[index],
                                              fit: BoxFit
                                                  .contain, // Adjust the fit as needed
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // ],
                                // ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                  color: Color.fromARGB(121, 0, 0, 0),
                                  width: 2.0),
                            ),
                            color: Color.fromARGB(255, 255, 255, 255),
                            colorBrightness: Brightness.dark,
                            onPressed: _add, //() {
                            //   Navigator.of(context)
                            //       .pushReplacementNamed('/login');
                            // },
                            child: Text(
                              '87'.tr,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
