// ignore_for_file: unused_local_variable, unused_import

import 'package:connectivity/connectivity.dart';
import 'package:derot/Users/ChangePassword.dart';
import 'package:flutter/material.dart';
import 'package:derot/DataBase/Transition.dart';
//import 'package:derot/Home.dart';
import 'package:derot/DataBase/sharedPrefences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validators/validators.dart';
import 'package:derot/DataBase/internetConnection.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => loginScreenState();
}

class loginScreenState extends State<LoginPage> {
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  void check = InternetCheckWidget;

  // bool _isConnected = true;
  // Future<void> _checkConnectivity() async {
  //   var connectivityResult = await Connectivity().checkConnectivity();
  //   setState(() {
  //     _isConnected = connectivityResult != ConnectivityResult.none;
  //   });
  // }

  @override
  void dispose() {
    _textEditingController.clear();
    super.dispose();
  }

  bool isEmailCorrect = false;
  bool isPasswordCorrect = false;
  final _formKey = GlobalKey<FormState>();

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: email.text, password: password.text);

        SharedPreferencesService.setLoggedIn(true);
        Navigator.of(context).pushReplacementNamed('/home');
        //isPasswordCorrect = true;
      } on FirebaseAuthException catch (e) {
        isEmailCorrect = false;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('64'.tr)),
        );
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return '65'.tr;
    } else if (!isEmail(value)) {
      return '66'.tr;
    }

    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '67'.tr;
    } else if (value.length < 6) {
      return '68'.tr;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/beersheva.jpg',
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
                  // Lottie.network(
                  //   'https://assets6.lottiefiles.com/packages/lf20_k9wsvzgd.json',
                  //   animate: true,
                  //   height: 120,
                  //   width: 600,
                  // ),

                  Image.asset(
                    'assets/icons/login.gif',
                    width: 70, // Adjust width as needed
                    height: 70,
                    // Adjust height as needed
                  ),

                  Text(
                    '7'.tr,
                    style: GoogleFonts.indieFlower(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20)),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
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
                                controller: email,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  labelText: '18'.tr,
                                  hintText: 'your-email@domain.com',
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Color.fromARGB(232, 0, 0, 0),
                                  ),
                                  labelStyle: TextStyle(
                                      color: Color.fromARGB(201, 0, 0, 0),
                                      fontSize: 16),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8),
                                ),
                                validator: _validateEmail,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              child: TextFormField(
                                controller: password,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  labelText: '13'.tr,
                                  hintText: '*********',
                                  prefixIcon: Icon(
                                    Icons.lock_open,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                  labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8),
                                ),
                                validator: _validatePassword,
                                obscureText: true,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(CustomPageRoute(
                                  pageBuilder: (context) => ForgetPage(),
                                ));
                              },
                              child: Row(
                                children: [
                                  SizedBox(width: 155),
                                  Text(
                                    '14'.tr,
                                    style: const TextStyle(
                                      // color: Color.fromARGB(232, 20, 0, 243),
                                      color: Color.fromARGB(198, 74, 74, 74),
                                      fontWeight: FontWeight.bold,
                                      decorationThickness: 2.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            //margin: EdgeInsets.only(left: 110, right: 107),
                            child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(
                                      color: Color.fromARGB(121, 0, 0, 0),
                                      width: 2.0),
                                ),
                                color: Color.fromARGB(255, 255, 255, 255),
                                colorBrightness: Brightness.dark,
                                onPressed: _login,
                                child: Row(
                                  children: [
                                    SizedBox(width: 28),
                                    Text(
                                      '7'.tr,
                                      style: const TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 28),
                                  ],
                                )),
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
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed('/home');
                          },
                          child: Text(
                            '1'.tr,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '15'.tr,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed('register');
                        },
                        child: Text(
                          '16'.tr,
                          style: const TextStyle(
                            // color: Color.fromARGB(232, 20, 0, 243),
                            color: Color.fromARGB(198, 74, 74, 74),

                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            //decorationColor: Color.fromARGB(255, 2, 241, 133),
                            decorationThickness: 2.0,
                          ),
                        ),
                      ),
                    ],
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
