//import 'package:derot/Cities/settings.dart';
import 'package:derot/Customer/Cities/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditChoices extends StatefulWidget {
  const EditChoices({super.key});
  @override
  State<EditChoices> createState() {
    return _EditChoiceState();
  }
}

class _EditChoiceState extends State<EditChoices> {
  double _sliderValue = 20000;
  //final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  int _counter = 0;
  bool _isSwitched = false;
  bool _isSwitcheds = false;
  Choice _selectedCategory1 = Choice.partners;
  Choice _selectedCategory2 = Choice.partners;

  @override
  void dispose() {
    //_titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _increaseCounter() {
    if (_counter < 10) {
      setState(() {
        _counter++;
      });
    }
  }

  void _decreaseCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(height: 16.0),
          Row(
            children: [
              SizedBox(width: 100),
              Text(
                '30'.tr,
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                ' ${_sliderValue.toStringAsFixed(0)}',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),

          SizedBox(height: 1.0),
          Slider(
            value: _sliderValue,
            min: 0,
            max: 20000,
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
              });
            },
          ),

          Row(
            children: [
              Container(
                width: 170,
                child: Row(
                  children: [
                    Text('31'.tr),
                    IconButton(
                      onPressed: _increaseCounter,
                      icon: Icon(Icons.add),
                    ),
                    Text('$_counter'),
                    IconButton(
                      onPressed: _decreaseCounter,
                      icon: Icon(Icons.minimize_rounded),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              // const SizedBox(
              //   width: 1,
              // ),
              // const SizedBox(
              //   width: 16,
              // ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [],
                ),
              ),
            ],
          ),
          //const SizedBox(height: 16),
          Row(
            children: [
              Text('32'.tr),
              // Text(
              //   'Switch Status: ${_isSwitched ? 'On' : 'Off'}',
              //   style: TextStyle(fontSize: 20.0),
              // ),

              SizedBox(height: 16.0),
              Switch(
                value: _isSwitched,
                onChanged: (value) {
                  setState(() {
                    _isSwitched = value;
                  });
                },
                activeColor: Color.fromARGB(
                    255, 19, 157, 6), // Customize the active color
              ),

              Row(
                children: [
                  //Spacer(),
                  Text('33'.tr),
                  // Text(
                  //   'Switch Status: ${_isSwitched ? 'On' : 'Off'}',
                  //   style: TextStyle(fontSize: 20.0),
                  // ),

                  SizedBox(height: 16.0),
                  Switch(
                    value: _isSwitcheds,
                    onChanged: (value) {
                      setState(() {
                        _isSwitcheds = value;
                      });
                    },
                    activeColor: Color.fromARGB(
                        255, 16, 140, 5), // Customize the active color
                  ),
                ],
              ),
            ],
          ),

          Column(
            children: [
              Row(
                children: [
                  Text('34'.tr),
                  DropdownButton(
                      value: _selectedCategory1,
                      items: Choice.values
                          .map(
                            (category) => DropdownMenuItem(
                              value: category,
                              child: Text(
                                category.name.toString(),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          _selectedCategory1 = value;
                        });
                      }),
                  const Spacer(),
                ],
              ),
              Row(
                children: [
                  Text('35'.tr),
                  DropdownButton(
                      value: _selectedCategory2,
                      items: Choice.values
                          .map(
                            (category) => DropdownMenuItem(
                              value: category,
                              child: Text(
                                category.name.toString(),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          _selectedCategory2 = value;
                        });
                      }),
                ],
              ),
            ],
          ),

          Column(
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('37'.tr),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // print(_titleController.text);
                      print(_amountController.text);
                    },
                    child: Text('36'.tr),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
