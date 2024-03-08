// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ShareApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           // Your page content goes here
//           Center(
//             child: SharePage(),
//           ),
//           // Back arrow button positioned at the bottom-left corner
//           Positioned(
//             top: 26.0, // Adjust the bottom distance as needed
//             left: 6.0, // Adjust the left distance as needed
//             child: IconButton(
//               icon: Icon(Icons.arrow_back_rounded),
//               onPressed: () {
//                 Navigator.pushReplacementNamed(
//                     context, '/login'); // Navigate back
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SharePage extends StatefulWidget {
//   @override
//   _SharePageState createState() => _SharePageState();
// }

// class _SharePageState extends State<SharePage> {
//   //bool _isChecked = false;
//   TextEditingController _price = TextEditingController();
//   TextEditingController _rooms = TextEditingController();
//   TextEditingController _floor = TextEditingController();
//   //TextEditingController _checkin = TextEditingController();
//   TextEditingController _note = TextEditingController();

//   // void _share() {
//   //   String price = _price.text;
//   //   String rooms = _rooms.text;
//   //   String floor = _floor.text;
//   //   String checkin = _checkin.text;
//   //   String note = _note.text;
//   //   print('price: $price');
//   //   print('rooms: $rooms');
//   //   print('floor: $floor');
//   //   print('checkin: $checkin');
//   //   print('note: $note');
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//           padding: EdgeInsets.all(16),
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Color.fromARGB(255, 185, 197, 207),
//               const Color.fromARGB(255, 245, 246, 246)
//             ],
//           )),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextField(
//                 controller: _price,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(labelText: '30'.tr),
//               ),
//               TextField(
//                 controller: _rooms,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(labelText: '31'.tr),
//               ),
//               TextField(
//                 controller: _floor,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(labelText: '38'.tr),
//               ),
//               TextField(
//                 controller: _note,
//                 decoration: InputDecoration(labelText: '39'.tr),
//               ),
//               SizedBox(height: 32),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushReplacementNamed(context, '/nextshare');
//                 },
//                 child: Text(
//                   'המשך',
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.teal,
//                   minimumSize: Size(50, 50), // Set the minimum dimensions
//                 ),
//               ),
//             ],
//           )),
//     );
//   }
// }
