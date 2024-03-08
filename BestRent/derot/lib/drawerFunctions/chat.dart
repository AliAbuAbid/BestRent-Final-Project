import 'package:derot/HouseRent/ApartmentIcons.dart';
//import 'package:derot/Customer/Cities/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:derot/Customer/Cities/beerSheva.dart';
//import 'package:derot/DataBase/Transition.dart';
//import 'package:derot/Users/login.dart';
import 'package:google_fonts/google_fonts.dart';

class Chat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Chat();
  }
}

class _Chat extends State<Chat> {
  States _selectedstate = States.center;
  TextEditingController _cityController = TextEditingController();
  final _streetController = TextEditingController();
  final _streetnController = TextEditingController();
  final _expController = TextEditingController();
  //Kind house;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(117, 207, 222, 234),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          // Your page content goes here
          ChatPage(),
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

                
                    //Spacer(),
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

                    //  Spacer(),
                    DropdownButton<States>(
                      iconSize: 28,
                      dropdownColor: Color.fromARGB(255, 222, 232, 244),
                      value: _selectedstate,
                      onChanged: (States? value) {
                        setState(() {
                          _selectedstate = value!;
                        });
                      },
                      items:
                          categoryStates.entries.map<DropdownMenuItem<States>>(
                        (MapEntry<States, String> entry) {
                          return DropdownMenuItem<States>(
                            value: entry.key,
                            child: Text(
                              entry.value,
                              style: GoogleFonts.lato(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          );
                        },
                      ).toList(),
                    ),
                    //Spacer(),

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

                            decoration: InputDecoration(labelText: '34'.tr),
                          ),
                        ),
                        SizedBox(height: 32),
                        Container(
                          // textDirection: TextDirection.rtl,
                          child: TextField(
                            controller: _streetnController,
                            textAlign: TextAlign
                                .left, // Align the label text to the right
                            decoration: InputDecoration(labelText: '35'.tr),
                          ),
                        ),
                        SizedBox(height: 32),
                        Container(
                          //textDirection: TextDirection.rtl,
                          child: TextField(
                            controller: _streetController,
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
                            maxLines: null,
                            controller: _expController,
                            textAlign: TextAlign
                                .left, // Align the label text to the right
                            decoration: InputDecoration(labelText: '39'.tr),
                          ),
                        ),
                        SizedBox(height: 32)
                      ],
                    ),
                  ],
                ),
              ],
              //TextField(),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(75, 207, 222, 234),
            Color.fromARGB(191, 216, 224, 224),
            Color.fromARGB(62, 216, 224, 224),
          ],
        ),
      ),
    );
  }
}
