// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class WhatInApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('פרסום דירה'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(
                context, '/nextshare'); // Navigate back to the previous page
          },
        ),
      ),
      body: WhatInPage(),
    );
  }
}

class WhatInPage extends StatefulWidget {
  @override
  _WhatInState createState() => _WhatInState();
}

class _WhatInState extends State<WhatInPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // buildCheckboxItem('נכס בבלעדיות', _isChecked1),
            // buildCheckboxItem('מיזוג', _isChecked2),
            // buildCheckboxItem('סורגים', _isChecked3),
            // buildCheckboxItem('דוד שמש', _isChecked4),
            // buildCheckboxItem('גישה לנכים', _isChecked5),
            // buildCheckboxItem('משופצת', _isChecked6),
            // buildCheckboxItem('ממ"ד', _isChecked7),
            // buildCheckboxItem('מחסן', _isChecked8),
            // buildCheckboxItem('חיות מחמד', _isChecked9),
            // buildCheckboxItem('ריהוט', _isChecked10),
            // buildCheckboxItem('גמיש', _isChecked11),
            // buildCheckboxItem('לטווח ארוך', _isChecked12),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text('שמור'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: Size(50, 50), // Set the minimum dimensions
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCheckboxItem(String title, bool value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(title),
        Checkbox(
          value: value,
          onChanged: (bool? newValue) {
            setState(() {
              if (title == 'נכס בבלעדיות') {
                _isChecked1 = newValue!;
              }
              ;
              if (title == 'מיזוג') _isChecked2 = newValue!;
              if (title == 'סורגים') _isChecked3 = newValue!;
              if (title == 'דוד שמש') _isChecked4 = newValue!;
              if (title == 'גישה לנכים') _isChecked5 = newValue!;
              if (title == 'משופצת') _isChecked6 = newValue!;
              if (title == 'ממ"ד') _isChecked7 = newValue!;
              if (title == 'מחסן') _isChecked8 = newValue!;
              if (title == 'חיות מחמד') _isChecked9 = newValue!;
              if (title == 'ריהוט') _isChecked10 = newValue!;
              if (title == 'גמיש') _isChecked11 = newValue!;
              if (title == 'לטווח ארוך') _isChecked12 = newValue!;
            });
          },
        ),
      ],
    );
  }
}
