// // // ignore_for_file: unused_local_variable, unused_import, unused_field

// // ignore_for_file: unused_field

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:derot/Admin/ApartmentIcons.dart';
// import 'package:flutter/material.dart';
// //import 'package:derot/Home.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// // ignore: unused_import
// import 'package:validators/validators.dart';

// class AddHouse extends StatefulWidget {
//   const AddHouse({Key? key}) : super(key: key);

//   @override
//   State<AddHouse> createState() => _AddHouse();
// }

// class _AddHouse extends State<AddHouse> {
//   final _formKey = GlobalKey<FormState>();
//   Kind _selectedhouse = Kind.partners;
//   States _selectedstate = States.center;
//   TextEditingController _cityController = TextEditingController();
//   final _streetController = TextEditingController();
//   final _streetnController = TextEditingController();
//   final _expController = TextEditingController();
//   //Kind house;

//   void _add() async {
//     // if (_formKey.currentState!.validate()) {
//     String userPhone = '';
//     String userFullname = '';
//     try {
//       FirebaseFirestore firestore = FirebaseFirestore.instance;
//       //User? user = FirebaseAuth.instance.currentUser;
//       final userEmail = FirebaseAuth.instance.currentUser?.email;
//       QuerySnapshot<Map<String, dynamic>> querySnapshot =
//           await FirebaseFirestore.instance
//               .collection('users')
//               .where('email', isEqualTo: userEmail)
//               .get();
//       if (querySnapshot.docs.isNotEmpty) {
//         userPhone = querySnapshot.docs[0].data()['phone'];
//         userFullname = querySnapshot.docs[0].data()['username'];
//         //print('User profile photo: $userProfilePhoto');
//       } else {
//         print('No user found with the email: $userEmail');
//       }
//       await firestore.collection('apartments').add({
//         'email': userEmail,
//         'phone': userPhone,
//         'username': userFullname,
//         'house': _selectedhouse.toString(),
//         'district': _selectedstate.toString(),
//         'city': _cityController.text,
//         'street': _streetController.text,
//         'streetNumber': _streetnController.text,
//         'explain': _expController.text,
//       });

//       // Navigator.of(context).pushReplacementNamed('/login');
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('81'.tr)),
//         );
//         print('81'.tr);
//       }
//     } catch (e) {
//       print(e);
//     }
//     //}
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(
//               'assets/images/apartments.jpg',
//             ),
//             fit: BoxFit.cover,
//             opacity: 0.3,
//           ),
//         ),
//         child: SafeArea(
//           child: Center(
//             child: SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(
//                     //crossAxisAlignment: CrossAxisAlignment.start,
//                     //mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       AppBar(
//                         backgroundColor:
//                             Colors.transparent, // Make app bar transparent
//                         elevation: 0, // Remove app bar shadow
//                       ),
//                     ],
//                   ),
//                   SingleChildScrollView(
//                     padding: EdgeInsets.all(32),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             //padding: EdgeInsets.only(left: 120),
//                             //SizedBox(width: 10),
//                             Text(
//                               '40'.tr,
//                               style: GoogleFonts.lato(
//                                   color: Color.fromARGB(255, 0, 0, 0),
//                                   fontSize: 19,
//                                   fontWeight: FontWeight.bold),
//                               textAlign: TextAlign.center,
//                             ),
//                             // Spacer(),
//                             SizedBox(height: 10),

//                             // DropdownButton<Kind>(
//                             //   iconSize: 28,
//                             //   dropdownColor: Color.fromARGB(255, 222, 232, 244),
//                             //   value: _selectedhouse,
//                             //   onChanged: (Kind? value) {
//                             //     setState(() {
//                             //       _selectedhouse = value!;
//                             //     });
//                             //   },
//                             //   items: categoryNames.entries
//                             //       .map<DropdownMenuItem<Kind>>(
//                             //     (MapEntry<Kind, String> entry) {
//                             //       return DropdownMenuItem<Kind>(
//                             //         value: entry.key,
//                             //         child: Text(
//                             //           entry.value,
//                             //           style: GoogleFonts.lato(
//                             //             color: Color.fromARGB(255, 0, 0, 0),
//                             //             fontSize: 18,
//                             //           ),
//                             //           textAlign: TextAlign.center,
//                             //         ),
//                             //       );
//                             //     },
//                             //   ).toList(),
//                             // ),
//                             //Spacer(),
//                             DropdownButton(
//                                 value: _selectedhouse,
//                                 items: Kind.values
//                                     .map(
//                                       (lang) => DropdownMenuItem(
//                                         value: lang,
//                                         child: Text(
//                                           lang.kindValue.toString(),
//                                         ),
//                                       ),
//                                     )
//                                     .toList(),
//                                 onChanged: (value) {
//                                   if (value == null) {
//                                     return;
//                                   }
//                                   setState(() {
//                                     _selectedhouse = value;
//                                   });
//                                 }),
//                           ],
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(height: 32),
//                             //padding: EdgeInsets.only(left: 120),
//                             Text(
//                               '41'.tr,
//                               style: GoogleFonts.lato(
//                                   color: Color.fromARGB(255, 0, 0, 0),
//                                   fontSize: 19,
//                                   fontWeight: FontWeight.bold),
//                               textAlign: TextAlign.center,
//                             ),
//                             SizedBox(height: 10),

//                             //  Spacer(),
//                             // DropdownButton<States>(
//                             //   iconSize: 28,
//                             //   dropdownColor: Color.fromARGB(255, 222, 232, 244),
//                             //   value: _selectedstate,
//                             //   onChanged: (States? value) {
//                             //     setState(() {
//                             //       _selectedstate = value!;
//                             //     });
//                             //   },
//                             //   items: categoryStates.entries
//                             //       .map<DropdownMenuItem<States>>(
//                             //     (MapEntry<States, String> entry) {
//                             //       return DropdownMenuItem<States>(
//                             //         value: entry.key,
//                             //         child: Text(
//                             //           entry.value,
//                             //           style: GoogleFonts.lato(
//                             //             color: Color.fromARGB(255, 0, 0, 0),
//                             //             fontSize: 18,
//                             //           ),
//                             //           textAlign: TextAlign.center,
//                             //         ),
//                             //       );
//                             //     },
//                             //   ).toList(),
//                             // ),
//                             //Spacer(),

//                             DropdownButton(
//                                 value: _selectedstate,
//                                 items: States.values
//                                     .map(
//                                       (lang) => DropdownMenuItem(
//                                         value: lang,
//                                         child: Text(
//                                           lang.statesValue.toString(),
//                                         ),
//                                       ),
//                                     )
//                                     .toList(),
//                                 onChanged: (value) {
//                                   if (value == null) {
//                                     return;
//                                   }
//                                   setState(() {
//                                     _selectedstate = value;
//                                   });
//                                 }),
//                             SizedBox(height: 10),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 SizedBox(height: 32),
//                                 Container(
//                                   //textDirection: TextDirection.rtl,
//                                   child: TextField(
//                                     controller: _cityController,
//                                     textAlign: TextAlign
//                                         .left, // Align the label text to the right

//                                     decoration:
//                                         InputDecoration(labelText: '34'.tr),
//                                   ),
//                                 ),
//                                 SizedBox(height: 32),
//                                 Container(
//                                   // textDirection: TextDirection.rtl,
//                                   child: TextField(
//                                     controller: _streetnController,
//                                     textAlign: TextAlign
//                                         .left, // Align the label text to the right
//                                     decoration:
//                                         InputDecoration(labelText: '35'.tr),
//                                   ),
//                                 ),
//                                 SizedBox(height: 32),
//                                 Container(
//                                   //textDirection: TextDirection.rtl,
//                                   child: TextField(
//                                     controller: _streetController,
//                                     keyboardType: TextInputType.number,
//                                     decoration: InputDecoration(
//                                       label: Text('42'.tr),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height: 32),
//                                 Container(
//                                   //textDirection: TextDirection.rtl,
//                                   child: TextField(
//                                     maxLines: null,
//                                     controller: _expController,
//                                     textAlign: TextAlign
//                                         .left, // Align the label text to the right
//                                     decoration:
//                                         InputDecoration(labelText: '39'.tr),
//                                   ),
//                                 ),
//                                 SizedBox(height: 32)
//                               ],
//                             ),
//                           ],
//                         ),
//                         Container(
//                           child: MaterialButton(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               side: const BorderSide(
//                                   color: Color.fromARGB(121, 0, 0, 0),
//                                   width: 2.0),
//                             ),
//                             color: Color.fromARGB(255, 255, 255, 255),
//                             colorBrightness: Brightness.dark,
//                             onPressed: _add, //() {
//                             //   Navigator.of(context)
//                             //       .pushReplacementNamed('/login');
//                             // },
//                             child: Text(
//                               '87'.tr,
//                               style: const TextStyle(
//                                   color: Color.fromARGB(255, 0, 0, 0),
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
