// // // ignore_for_file: unused_local_variable, unused_import, unused_field

// ignore_for_file: unused_field, unused_import, duplicate_ignore, deprecated_member_use, unused_element, unused_local_variable, equal_keys_in_map

import 'dart:core';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:derot/HouseRent/ApartmentIcons.dart';
import 'package:derot/Admin/whatIn.dart';
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
// ignore: unused_import
import 'package:validators/validators.dart';

class EditHouse extends StatefulWidget {
  const EditHouse({Key? key}) : super(key: key);

  @override
  State<EditHouse> createState() => _EditHouse();
}

class _EditHouse extends State<EditHouse> {
  final _formKey = GlobalKey<FormState>();
  Kind _selectedhouse = Kind.partners;
  States _selectedstate = States.center;
  // TextEditingController _cityController = TextEditingController();
  // final _streetController = TextEditingController();
  // final _streetnController = TextEditingController();
  // final _expController = TextEditingController();
  // final _building = TextEditingController();
  // final _rooms = TextEditingController();
  // final _price = TextEditingController();
  int documentCount = 0;

  String email = '';
  String city = '';
  bool pets = false;
  bool renovated = false;
  bool shelter = false;
  String building = '';
  String district = '';
  String explain = '';
  bool storage = false;
  bool accessForDisabled = false;
  bool airCondition = false;
  bool bars = false;
  bool exclusiveProperty = false;
  bool furniture = false;
  bool heater = false;
  bool longTerm = false;
  String house = '';
  String phone = '';
  String price = '';
  String street = '';
  String streetNumber = '';
  String username = '';
  String rooms = '';
  bool flexible = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController buildingController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController streetNumberController = TextEditingController();
  TextEditingController explainController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController roomsController = TextEditingController();

  //Kind house;
  List<String> downloadUrls = [];
  List<File> _images = [];
  bool x = false;
  late String document;
  late String documentId;
  int k = 0;

  int? selectedImage;

  Future<void> _pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      setState(() {
        _images.add(File(image.path));
      });
    }
  }

/////

  void showDetails() async {
    try {
      // Retrieve the collection reference
      CollectionReference apartmentsRef =
          FirebaseFirestore.instance.collection('apartments');

      // Fetch the documents from the collection
      QuerySnapshot<Object?> snapshot = await apartmentsRef.get();

      // Process each document in the snapshot
      snapshot.docs.forEach((DocumentSnapshot<Object?> document) {
        // Extract data from the document
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;

        String address = document['email'];
        city = document['city'];
        bool pets = document['Pets'];
        bool renovated = document['Renovated'];
        bool shelter = document['Shelter'];
        String building = document['building'];
        String district = document['district'];
        String explain = document['explain'];
        bool storage = document['Storage'];
        bool accessForDisabled = document['AccessForDisabled'];
        bool airCondition = document['AirCondition'];
        bool bars = document['Bars'];
        bool exclusiveProperty = document['LongTerm'];
        bool furniture = document['Furniture'];
        bool heater = document['Heater'];
        bool longTerm = document['LongTerm'];
        String house = document['house'];
        String phone = document['phone'];
        String price = document['price'];
        String street = document['street'];
        String streetNumber = document['streetNumber'];
        String username = document['username'];
        bool flexible = document['flexible'];

        documentId = document.id;

        TextEditingController emailController =
            TextEditingController(text: document['email']);
        TextEditingController cityController =
            TextEditingController(text: document['city']);
        TextEditingController buildingController =
            TextEditingController(text: document['building']);
        TextEditingController streetController =
            TextEditingController(text: document['street']);
        TextEditingController streetNumberController =
            TextEditingController(text: document['streetNumber']);
        TextEditingController explainController =
            TextEditingController(text: document['explain']);
        TextEditingController phoneController =
            TextEditingController(text: document['phone']);
        TextEditingController priceController =
            TextEditingController(text: document['price']);
        TextEditingController usernameController =
            TextEditingController(text: document['username']);
        // Get the document ID

        // Print or use the extracted data as needed
        print('Document ID: $documentId');
        print('Address: $address');
        print('City: $city');
        // Print other fields...
      });
    } catch (e) {
      // Handle errors
      print('Error fetching data: $e');
    }
  }

/////

  void _edit() async {
    try {
      // Get a reference to the Firestore collection
      CollectionReference apartmentsRef =
          FirebaseFirestore.instance.collection('apartments');

      // Get a reference to the specific document you want to update
      print('mmmy document $documentId');
      DocumentReference documentRef = apartmentsRef.doc(documentId);

      // Create a map containing the fields to update and their new values
      Map<String, dynamic> updatedData = {
        'address': street,
        'city': city,
        'Pets': pets,
        'Renovated': renovated,
        'Shelter': shelter,
        'building': building,
        'district': district,
        'explain': explain,
        'Storage': storage,
        'AccessForDisabled': accessForDisabled,
        'AirCondition': airCondition,
        'Bars': bars,
        'LongTerm': exclusiveProperty,
        'Furniture': furniture,
        'Heater': heater,
        'LongTerm': longTerm,
        'house': house,
        'phone': phone,
        'price': price,
        'street': street,
        'streetNumber': streetNumber,
        'username': username,
        'flexible': flexible,
      };

      // Update the document with the new data
      await documentRef.update(updatedData);

      print('Document updated successfully');
    } catch (e) {
      print('Error updating document: $e');
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
              if (title == '88'.tr) exclusiveProperty = newValue!;
              if (title == '89'.tr) airCondition = newValue!;
              if (title == '90'.tr) bars = newValue!;
              if (title == '91'.tr) heater = newValue!;
              if (title == '92'.tr) accessForDisabled = newValue!;
              if (title == '93'.tr) renovated = newValue!;
              if (title == '94'.tr) shelter = newValue!;
              if (title == '95'.tr) storage = newValue!;
              if (title == '96'.tr) pets = newValue!;
              if (title == '97'.tr) furniture = newValue!;
              if (title == '98'.tr) flexible = newValue!;
              if (title == '99'.tr) longTerm = newValue!;
            });
          },
        ),
        Text(title),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    showDetails();

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
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 20, top: 20),
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                    child: TextFormField(
                                      // controller: cityController,
                                      initialValue: city,
                                      textAlign: TextAlign.left,
                                      decoration: InputDecoration(
                                        labelText: '34'.tr,
                                        // prefixIcon: Icon(
                                        //   Icons.person,
                                        //   color: Color.fromARGB(232, 0, 0, 0),
                                        // ),
                                        labelStyle: TextStyle(
                                            color: Color.fromARGB(201, 0, 0, 0),
                                            fontSize: 16),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 8),
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 32),
                                Container(
                                  // textDirection: TextDirection.rtl,
                                  child: TextField(
                                    controller: streetController,
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
                                    controller: streetNumberController,
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
                                    controller: buildingController,
                                    decoration: InputDecoration(
                                      label: Text('104'.tr),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 32),

                                Container(
                                  //textDirection: TextDirection.rtl,
                                  child: TextField(
                                    controller: roomsController,
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
                                    keyboardType: TextInputType.number,
                                    controller: priceController,
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
                                    controller: explainController,
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
                                            exclusiveProperty,
                                          ),
                                          buildCheckboxItem(
                                              '89'.tr, airCondition),
                                          buildCheckboxItem('90'.tr, bars),
                                          buildCheckboxItem('91'.tr, heater),
                                          buildCheckboxItem(
                                              '92'.tr, accessForDisabled),
                                          buildCheckboxItem('93'.tr, renovated),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          buildCheckboxItem('94'.tr, shelter),
                                          buildCheckboxItem('95'.tr, storage),
                                          buildCheckboxItem('96'.tr, pets),
                                          buildCheckboxItem('97'.tr, furniture),
                                          buildCheckboxItem('98'.tr, flexible),
                                          buildCheckboxItem('99'.tr, longTerm),
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
                            onPressed: _edit, //() {
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
