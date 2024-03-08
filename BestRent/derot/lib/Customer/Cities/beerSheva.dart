//import 'package:csc_picker/csc_picker.dart';
import 'package:derot/Customer/Cities/edit_choices.dart';
//import 'package:derot/Home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class North extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _editChoice() {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => const EditChoices(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '24'.tr,
          style: GoogleFonts.lato(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true, // Center the title horizontally

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit_sharp),
            onPressed: _editChoice,
          ),
        ],
      ),
      body: Stack(
        children: [
          //Text('choose country'),
          // Scaffold(
          //   body: CSCPicker(
          //     onCountryChanged: () {
          //       //final country = 'israel';
          //     },
          //     onStateChanged: (state) {},
          //     onCityChanged: (city) {
          //       //final country = 'Israel';
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}

class CenterT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _editChoice() {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => const EditChoices(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '25'.tr,
          style: GoogleFonts.lato(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true, // Center the title horizontally

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit_sharp),
            onPressed: _editChoice,
          ),
        ],
      ),
      // body: Stack(
      //   children: [],
      // ),
    );
  }
}

class South extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _editChoice() {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => const EditChoices(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '29'.tr,
          style: GoogleFonts.lato(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true, // Center the title horizontally

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit_sharp),
            onPressed: _editChoice,
          ),
        ],
      ),
      body: Stack(
        children: [],
      ),
    );
  }
}

class TelAvivYafo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _editChoice() {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => const EditChoices(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '27'.tr,
          style: GoogleFonts.lato(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true, // Center the title horizontally

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit_sharp),
            onPressed: _editChoice,
          ),
        ],
      ),
      body: Stack(
        children: [],
      ),
    );
  }
}

class Haifa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _editChoice() {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => const EditChoices(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '26'.tr,
          style: GoogleFonts.lato(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true, // Center the title horizontally

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit_sharp),
            onPressed: _editChoice,
          ),
        ],
      ),
      body: Stack(
        children: [],
      ),
    );
  }
}

class Jeruzalim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _editChoice() {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => const EditChoices(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '28'.tr,
          style: GoogleFonts.lato(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true, // Center the title horizontally

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit_sharp),
            onPressed: _editChoice,
          ),
        ],
      ),
      body: Stack(
        children: [],
      ),
    );
  }
}
