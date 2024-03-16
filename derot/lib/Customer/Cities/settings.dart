//import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

enum Choice { price, rooms, partners, sablett }

const categoryIcons = {
  Choice.price: Icons.money,
  Choice.rooms: Icons.room,
  Choice.partners: Icons.ac_unit_outlined,
};

class Expense {
  Expense(this.id, {
    required this.sablett,
    required this.amount,
    required this.partner,
    required this.category,
  });

  final String id;
  final bool sablett;
  final int amount;
  final bool partner;
  final Choice category;
}
