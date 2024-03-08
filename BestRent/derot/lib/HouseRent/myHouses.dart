// ignore_for_file: unused_local_variable, unused_import

import 'dart:io';
//import 'dart:js_util';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:derot/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:derot/DataBase/Transition.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validators/validators.dart';

class MyHouse extends StatefulWidget {
  const MyHouse({Key? key}) : super(key: key);

  @override
  State<MyHouse> createState() => _MyHouse();
}

class _MyHouse extends State<MyHouse> {
  final userEmail = FirebaseAuth.instance.currentUser?.email;
  String userPhone = '';
  String userFullname = '';
  bool x = false;

  void ChangeX() {
    x = false;
  }
  // Future<void> ViewHouses() async {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   //User? user = FirebaseAuth.instance.currentUser;
  //   final userEmail = FirebaseAuth.instance.currentUser?.email;
  //   QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
  //       .instance
  //       .collection('users')
  //       .where('email', isEqualTo: userEmail)
  //       .get();
  //   if (querySnapshot.docs.isNotEmpty) {
  //     userPhone = querySnapshot.docs[0].data()['phone'];
  //     userFullname = querySnapshot.docs[0].data()['username'];
  //     Container(
  //         child: Text('\n\n\n\n$userFullname\n\n\n\n\n$userPhone\n\n\n\n\n'));
  //     //print('User profile photo: $userProfilePhoto');
  //   } else {
  //     print('No user found with the email: $userPhone');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/apartments.jpg',
                ),
                fit: BoxFit.cover,
                opacity: 0.5,
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),

                    StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('apartments')
                          .where('email', isEqualTo: userEmail)
                          .snapshots(),
                      initialData: () async {
                        // final userEmail =
                        //     FirebaseAuth.instance.currentUser?.email;
                        QuerySnapshot<Map<String, dynamic>> querySnapshot =
                            await FirebaseFirestore.instance
                                .collection('users')
                                .where('email', isEqualTo: userEmail)
                                .get();
                      },
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        }
                        if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                          return Center(
                            child: Text('106'.tr),
                          );
                        }
                        return Container(
                          height: 670, //double.infinity,
                          width: double.infinity,
                          child: ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                var document = snapshot.data!.docs[index];
                                return Card(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('17'.tr +
                                          ': ' +
                                          document['username']),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('73'.tr + ': ' + document['phone']),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('18'.tr + ': ' + document['email']),

                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('35'.tr +
                                              ': ' +
                                              document['street']),
                                          SizedBox(width: 10),
                                          Text(' | '),
                                          SizedBox(width: 10),
                                          Text('42'.tr +
                                              ': ' +
                                              document['streetNumber']),
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: 10,
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              '34'.tr + ' ' + document['city']),
                                          SizedBox(width: 10),
                                          Text(' | '),
                                          SizedBox(width: 10),
                                          Text('50'.tr +
                                              ': ' +
                                              document['house']),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('41'.tr +
                                          ': ' +
                                          document['district']),
                                      //////////////////////
                                      ///fdfdfd

                                      ////////////////////////////
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('104'.tr +
                                              ': ' +
                                              document['building']),
                                          SizedBox(width: 10),
                                          Text(' | '),
                                          SizedBox(width: 10),
                                          Text('31'.tr +
                                              ' ' +
                                              document['rooms']),
                                          SizedBox(width: 10),
                                        ],
                                      ),

                                      SizedBox(height: 10),
                                      Text('30'.tr + ' ' + document['price']),
                                      SizedBox(height: 10),

                                      Text(
                                          '39'.tr + ': ' + document['explain']),
                                      SizedBox(
                                        height: 10,
                                      ),

                                      Container(
                                        height: 300,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: List.generate(
                                              document['Images'].length,
                                              (index) => (Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Image.file(
                                                  File(document['Images']
                                                      [index]),
                                                  fit: BoxFit.contain,
                                                  // height:
                                                  //     500, // Set the height of each image
                                                  // width:
                                                  //     150, // Set the width of each image
                                                ),
                                              )),
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: document['Pets']
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/pet.svg',
                                                        // Path to your SVG file
                                                        width:
                                                            18, // Adjust the width as needed
                                                        height:
                                                            18, // Adjust the height as needed
                                                        // ignore: deprecated_member_use
                                                        color: const Color
                                                            .fromARGB(255, 0, 0,
                                                            0), // Set the color of the icon
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        '96'.tr,
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/pet.svg',
                                                        // Path to your SVG file
                                                        width:
                                                            18, // Adjust the width as needed
                                                        height:
                                                            18, // Adjust the height as needed
                                                        // ignore: deprecated_member_use
                                                        color: Color.fromARGB(
                                                            255,
                                                            191,
                                                            180,
                                                            180), // Set the color of the icon
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        '96'.tr,
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              191,
                                                              180,
                                                              180),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                          ),
                                          /////////////////////////////////
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            child: document['Renovated']
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/revonated.svg',
                                                        // Path to your SVG file
                                                        width:
                                                            18, // Adjust the width as needed
                                                        height:
                                                            18, // Adjust the height as needed
                                                        // ignore: deprecated_member_use
                                                        color: const Color
                                                            .fromARGB(255, 0, 0,
                                                            0), // Set the color of the icon
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        '93'.tr,
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/revonated.svg',
                                                        // Path to your SVG file
                                                        width:
                                                            18, // Adjust the width as needed
                                                        height:
                                                            18, // Adjust the height as needed
                                                        // ignore: deprecated_member_use
                                                        color: Color.fromARGB(
                                                            255,
                                                            191,
                                                            180,
                                                            180), // Set the color of the icon
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        '93'.tr,
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              191,
                                                              180,
                                                              180),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),

                                          /////////////////////////////////
                                          Expanded(
                                            flex: -2,
                                            child: document['Shelter']
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/shelter.svg',
                                                        // Path to your SVG file
                                                        width:
                                                            18, // Adjust the width as needed
                                                        height:
                                                            18, // Adjust the height as needed
                                                        // ignore: deprecated_member_use
                                                        color: const Color
                                                            .fromARGB(255, 0, 0,
                                                            0), // Set the color of the icon
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        '94'.tr,
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/shelter.svg',
                                                        // Path to your SVG file
                                                        width:
                                                            18, // Adjust the width as needed
                                                        height:
                                                            18, // Adjust the height as needed
                                                        // ignore: deprecated_member_use
                                                        color: Color.fromARGB(
                                                            255,
                                                            191,
                                                            180,
                                                            180), // Set the color of the icon
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        '94'.tr,
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              191,
                                                              180,
                                                              180),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                      /////////////////////////////////
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: document['Storage']
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/storage.svg',
                                                        // Path to your SVG file
                                                        width:
                                                            18, // Adjust the width as needed
                                                        height:
                                                            18, // Adjust the height as needed
                                                        // ignore: deprecated_member_use
                                                        color: const Color
                                                            .fromARGB(255, 0, 0,
                                                            0), // Set the color of the icon
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        '95'.tr,
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/storage.svg',
                                                        // Path to your SVG file
                                                        width:
                                                            18, // Adjust the width as needed
                                                        height:
                                                            18, // Adjust the height as needed
                                                        // ignore: deprecated_member_use
                                                        color: Color.fromARGB(
                                                            255,
                                                            191,
                                                            180,
                                                            180), // Set the color of the icon
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        '95'.tr,
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              191,
                                                              180,
                                                              180),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          /////////////////////////////////
                                          Expanded(
                                            child: document['flexible']
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/flexible.svg',
                                                        // Path to your SVG file
                                                        width:
                                                            18, // Adjust the width as needed
                                                        height:
                                                            18, // Adjust the height as needed
                                                        // ignore: deprecated_member_use
                                                        color: const Color
                                                            .fromARGB(255, 0, 0,
                                                            0), // Set the color of the icon
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        '98'.tr,
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/flexible.svg',
                                                        // Path to your SVG file
                                                        width:
                                                            18, // Adjust the width as needed
                                                        height:
                                                            18, // Adjust the height as needed
                                                        // ignore: deprecated_member_use
                                                        color: Color.fromARGB(
                                                            255,
                                                            191,
                                                            180,
                                                            180), // Set the color of the icon
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        '98'.tr,
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              191,
                                                              180,
                                                              180),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),

                                          /////////////////////////////////
                                          Expanded(
                                            flex: -2,
                                            child: document['AccessForDisabled']
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/access.svg',
                                                        // Path to your SVG file
                                                        width:
                                                            18, // Adjust the width as needed
                                                        height:
                                                            18, // Adjust the height as needed
                                                        // ignore: deprecated_member_use
                                                        color: const Color
                                                            .fromARGB(255, 0, 0,
                                                            0), // Set the color of the icon
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        '92'.tr,
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/access.svg',
                                                        // Path to your SVG file
                                                        width:
                                                            18, // Adjust the width as needed
                                                        height:
                                                            18, // Adjust the height as needed
                                                        // ignore: deprecated_member_use
                                                        color: Color.fromARGB(
                                                            255,
                                                            191,
                                                            180,
                                                            180), // Set the color of the icon
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        '92'.tr,
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              191,
                                                              180,
                                                              180),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                      /////////////////////////////////
                                      Row(
                                        children: [
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: document['AirCondition']
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/snow.svg',
                                                        // Path to your SVG file
                                                        width:
                                                            18, // Adjust the width as needed
                                                        height:
                                                            18, // Adjust the height as needed
                                                        // ignore: deprecated_member_use
                                                        color: const Color
                                                            .fromARGB(255, 0, 0,
                                                            0), // Set the color of the icon
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        '102'.tr,
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/snow.svg',
                                                        // Path to your SVG file
                                                        width:
                                                            18, // Adjust the width as needed
                                                        height:
                                                            18, // Adjust the height as needed
                                                        // ignore: deprecated_member_use
                                                        color: Color.fromARGB(
                                                            255,
                                                            191,
                                                            180,
                                                            180), // Set the color of the icon
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        '102'.tr,
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              191,
                                                              180,
                                                              180),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          /////////////////////////////////
                                          Expanded(
                                            flex: 2,
                                            child: document['Bars']
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/bars.svg',
                                                        // Path to your SVG file
                                                        width:
                                                            18, // Adjust the width as needed
                                                        height:
                                                            18, // Adjust the height as needed
                                                        // ignore: deprecated_member_use
                                                        color: const Color
                                                            .fromARGB(255, 0, 0,
                                                            0), // Set the color of the icon
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        '90'.tr,
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/bars.svg',
                                                        // Path to your SVG file
                                                        width:
                                                            18, // Adjust the width as needed
                                                        height:
                                                            18, // Adjust the height as needed
                                                        // ignore: deprecated_member_use
                                                        color: Color.fromARGB(
                                                            255,
                                                            191,
                                                            180,
                                                            180), // Set the color of the icon
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        '90'.tr,
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              191,
                                                              180,
                                                              180),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                          ),
                                          /////////////////////////////////
                                          // SizedBox(
                                          //   width: 20,
                                          // ),
                                          Expanded(
                                            flex: -2,
                                            child: document['ExclusiveProperty']
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/exclusive.svg',
                                                        // Path to your SVG file
                                                        width:
                                                            18, // Adjust the width as needed
                                                        height:
                                                            18, // Adjust the height as needed
                                                        // ignore: deprecated_member_use
                                                        color: const Color
                                                            .fromARGB(255, 0, 0,
                                                            0), // Set the color of the icon
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        '88'.tr,
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/exclusive.svg',
                                                        // Path to your SVG file
                                                        width:
                                                            18, // Adjust the width as needed
                                                        height:
                                                            18, // Adjust the height as needed
                                                        // ignore: deprecated_member_use
                                                        color: Color.fromARGB(
                                                            255,
                                                            191,
                                                            180,
                                                            180), // Set the color of the icon
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        '88'.tr,
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              191,
                                                              180,
                                                              180),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(height: 10),
                                      /////////////////////////////////
                                      Row(
                                        children: [
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: document['Furniture']
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/furniture.svg',
                                                        // Path to your SVG file
                                                        width:
                                                            18, // Adjust the width as needed
                                                        height:
                                                            18, // Adjust the height as needed
                                                        // ignore: deprecated_member_use
                                                        color: const Color
                                                            .fromARGB(255, 0, 0,
                                                            0), // Set the color of the icon
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        '97'.tr,
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/furniture.svg',
                                                        // Path to your SVG file
                                                        width:
                                                            18, // Adjust the width as needed
                                                        height:
                                                            18, // Adjust the height as needed
                                                        // ignore: deprecated_member_use
                                                        color: Color.fromARGB(
                                                            255,
                                                            191,
                                                            180,
                                                            180), // Set the color of the icon
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        '97'.tr,
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              191,
                                                              180,
                                                              180),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          /////////////////////////////////
                                          Expanded(
                                            child: document['Heater']
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/heater.svg',
                                                        // Path to your SVG file
                                                        width:
                                                            18, // Adjust the width as needed
                                                        height:
                                                            18, // Adjust the height as needed
                                                        // ignore: deprecated_member_use
                                                        color: const Color
                                                            .fromARGB(255, 0, 0,
                                                            0), // Set the color of the icon
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        '91'.tr,
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/heater.svg',
                                                        // Path to your SVG file
                                                        width:
                                                            18, // Adjust the width as needed
                                                        height:
                                                            18, // Adjust the height as needed
                                                        // ignore: deprecated_member_use
                                                        color: Color.fromARGB(
                                                            255,
                                                            191,
                                                            180,
                                                            180), // Set the color of the icon
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        '91'.tr,
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              191,
                                                              180,
                                                              180),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),

                                          /////////////////////////////////
                                          Expanded(
                                            flex: -2,
                                            child: document['LongTerm']
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/longTerm.svg',
                                                        // Path to your SVG file
                                                        width:
                                                            18, // Adjust the width as needed
                                                        height:
                                                            18, // Adjust the height as needed
                                                        // ignore: deprecated_member_use
                                                        color: const Color
                                                            .fromARGB(255, 0, 0,
                                                            0), // Set the color of the icon
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        '99'.tr,
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/longTerm.svg',
                                                        // Path to your SVG file
                                                        width:
                                                            18, // Adjust the width as needed
                                                        height:
                                                            18, // Adjust the height as needed
                                                        // ignore: deprecated_member_use
                                                        color: Color.fromARGB(
                                                            255,
                                                            191,
                                                            180,
                                                            180), // Set the color of the icon
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        '99'.tr,
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              191,
                                                              180,
                                                              180),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: MaterialButton(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                side: const BorderSide(
                                                    color: Color.fromARGB(
                                                        121, 0, 0, 0),
                                                    width: 2.0),
                                              ),
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              colorBrightness: Brightness.dark,
                                              onPressed: () {}, //() {
                                              //   Navigator.of(context)
                                              //       .pushReplacementNamed('/login');
                                              // },
                                              child: Text(
                                                '103'.tr,
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Container(
                                            child: MaterialButton(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                side: const BorderSide(
                                                    color: Color.fromARGB(
                                                        121, 0, 0, 0),
                                                    width: 2.0),
                                              ),
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              colorBrightness: Brightness.dark,
                                              onPressed: () async {
                                                await document.reference
                                                    .delete();
                                              }, //() {
                                              //   Navigator.of(context)
                                              //       .pushReplacementNamed('/login');
                                              // },
                                              child: Text(
                                                '105'.tr,
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      /////////////////////////////////
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        );
                      },
                    ),
                    //),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent, // Make app bar transparent
                elevation: 0, // Remove app bar shadow
              ),
            ],
          ),
        ],
      ),
    );
  }
}
