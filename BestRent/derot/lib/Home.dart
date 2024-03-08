// ignore_for_file: unused_import, unused_field

import 'dart:ffi';
import 'dart:io';

import 'package:derot/HouseRent/myHouses.dart';
import 'package:derot/Users/login11.dart';
import 'package:derot/drawerFunctions/Favourites.dart';
import 'package:derot/drawerFunctions/calls.dart';
import 'package:derot/drawerFunctions/chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:derot/drawerFunctions/new-apartment.dart';
import 'package:derot/drawerFunctions/appSettings.dart';
import 'package:derot/main.dart';
import 'package:derot/DataBase/sharedPrefences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:derot/Customer/Cities/beerSheva.dart';
import 'package:derot/DataBase/Transition.dart';
import 'package:derot/Users/login.dart';
import 'package:derot/Users/profilephoto.dart';
import 'package:derot/locale/locale_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isLoggedIn = false;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => homeScreenState();
}

class homeScreenState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    isLoggedIn = SharedPreferencesService.isLoggedIn();
  }

  void ViewAdd() {
    if (isLoggedIn) {
      Navigator.of(context).push(CustomPageRoute(
        pageBuilder: (context) => AddHouse(),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('63'.tr),
        ),
      );
      Navigator.of(context).push(CustomPageRoute(
        pageBuilder: (context) => LoginPage(),
      ));
    }
  }

  void ViewChat() {
    if (isLoggedIn) {
      Navigator.of(context).push(CustomPageRoute(
        pageBuilder: (context) => Chat(),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('63'.tr),
        ),
      );
      Navigator.of(context).push(CustomPageRoute(
        pageBuilder: (context) => LoginPage(),
      ));
    }
  }

  void ViewCalls() {
    if (isLoggedIn) {
      Navigator.of(context).push(CustomPageRoute(
        pageBuilder: (context) => Calls(),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('63'.tr),
        ),
      );
      Navigator.of(context).push(CustomPageRoute(
        pageBuilder: (context) => LoginPage(),
      ));
    }
  }

  void ViewFavourites() {
    if (isLoggedIn) {
      Navigator.of(context).push(CustomPageRoute(
        pageBuilder: (context) => Favourites(),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('63'.tr),
        ),
      );
      Navigator.of(context).push(CustomPageRoute(
        pageBuilder: (context) => LoginPage(),
      ));
    }
  }

  void SharedHouses() {
    if (isLoggedIn) {
      Navigator.of(context).push(CustomPageRoute(
        pageBuilder: (context) => MyHouse(),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('63'.tr),
        ),
      );
      Navigator.of(context).push(CustomPageRoute(
        pageBuilder: (context) => LoginPage(),
      ));
    }
  }

  void Login() async {
    setState(() async {
      if (isLoggedIn) {
        // Logout
        await FirebaseAuth.instance.signOut();
        SharedPreferencesService.setLoggedIn(false);
        Navigator.of(context)
            .pushNamedAndRemoveUntil("/home", (route) => false); //Checking
      } else {
        //Login
        Navigator.of(context).pushReplacementNamed('/login');
      }
      isLoggedIn = !isLoggedIn;
    });
  }

  void _AppSettings() {
    Navigator.of(context).push(CustomPageRoute(
      pageBuilder: (context) => AppPage(),
    ));
  }

  MyLocaleController controllerLang = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 200,
        backgroundColor: Color.fromARGB(233, 234, 229, 229),
        child: Container(
          height: double.infinity,
          alignment: Alignment.topCenter,
          child: ListView(
            children: [
              //Card(
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isLoggedIn ? ProfilePhoto() : SizedBox(),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Column(
                children: [
                  Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                  ),
                  Container(
                    height: 40,
                    child: TextButton(
                      onPressed: Login,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.login,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            isLoggedIn ? '11'.tr : '7'.tr,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 40,
                    //  width: 100,
                    child: TextButton(
                      onPressed: ViewAdd,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_home_outlined, color: Colors.black),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '8'.tr,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 40,
                    //  width: 100,
                    child: TextButton(
                      onPressed: SharedHouses,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.home_outlined, color: Colors.black),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '101'.tr,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 40,
                    // width: 100,
                    child: TextButton(
                      onPressed: ViewChat,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.chat_outlined,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '9'.tr,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 40,
                    // width: 100,
                    child: TextButton(
                      onPressed: ViewCalls,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.call,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '10'.tr,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 40,
                    child: TextButton(
                      onPressed: ViewFavourites,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                          ),
                          SizedBox(
                              width: 5), // Adjust spacing between icon and text
                          Text(
                            '62'.tr,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 40,
                    //width: 100,
                    child: TextButton(
                      onPressed: _AppSettings,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.settings, color: Colors.black),
                          SizedBox(width: 5),
                          Text(
                            '2'.tr,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
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
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      //padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        title: Center(
                          child: Text(
                            'BestRent',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        actions: [
                          IconButton(
                            onPressed: () {
                              // Add your action functionality here
                            },
                            icon: Icon(
                              Icons.search,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 30,
                                        width: 150,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(CustomPageRoute(
                                            pageBuilder: (context) => North(),
                                          ));
                                        },
                                        child: ClipOval(
                                          child: Image.asset(
                                            'assets/images/north.jpg',
                                            width: 100.0,
                                            height: 100.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '24'.tr,
                                        style: GoogleFonts.lato(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            //  fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 30,
                                        width: 150,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(CustomPageRoute(
                                            pageBuilder: (context) => Haifa(),
                                          ));
                                        },
                                        child: ClipOval(
                                          child: Image.asset(
                                            'assets/images/haifa.jpg',
                                            width: 100.0,
                                            height: 100.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '26'.tr,
                                        style: GoogleFonts.lato(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            //  fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        width: 150,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(CustomPageRoute(
                                            pageBuilder: (context) => CenterT(),
                                          ));
                                        },
                                        child: ClipOval(
                                          child: Image.asset(
                                            'assets/images/center.jpg',
                                            width: 100.0,
                                            height: 100.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '25'.tr,
                                        style: GoogleFonts.lato(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            //  fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        width: 150,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(CustomPageRoute(
                                            pageBuilder: (context) => CenterT(),
                                          ));
                                        },
                                        child: ClipOval(
                                          child: Image.asset(
                                            'assets/images/telaviv.jpg',
                                            width: 100.0,
                                            height: 100.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '27'.tr,
                                        style: GoogleFonts.lato(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            //  fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        width: 150,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(CustomPageRoute(
                                            pageBuilder: (context) =>
                                                Jeruzalim(),
                                          ));
                                        },
                                        child: ClipOval(
                                          child: Image.asset(
                                            'assets/images/jeruzalim.jpg',
                                            width: 100.0,
                                            height: 100.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '28'.tr,
                                        style: GoogleFonts.lato(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            //  fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        width: 150,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(CustomPageRoute(
                                            pageBuilder: (context) => South(),
                                          ));
                                        },
                                        child: ClipOval(
                                          child: Image.asset(
                                            'assets/images/south.jpg',
                                            width: 100.0,
                                            height: 100.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '29'.tr,
                                        style: GoogleFonts.lato(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            //  fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 73.2,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
