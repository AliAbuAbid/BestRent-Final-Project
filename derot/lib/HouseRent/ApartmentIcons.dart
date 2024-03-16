//import 'package:flutter/material.dart';

import 'package:get/get.dart';

enum Kind {
  sablet,
  partners,
  apartment,
  house,
  roof,
  solo,
  pinthouse,
  garden,
  studio,
  personal,
  basement
}

enum States { center, haifa, north, jeruzalim, south, telAviv }

// Map<Kind, String> categoryNames = {
//   Kind.sablet: '58'.tr,
//   Kind.partners: '59'.tr,
//   Kind.apartment: '49'.tr,
//   Kind.house: '50'.tr,
//   Kind.roof: '52'.tr,
//   Kind.solo: '53'.tr,
//   Kind.pinthouse: '54'.tr,
//   Kind.garden: '55'.tr,
//   Kind.studio: '56'.tr,
//   Kind.personal: '57'.tr,
//   Kind.basement: "51".tr
// };

extension KindExtension on Kind {
  String get kindValue {
    switch (this) {
      case Kind.sablet:
        return '58'.tr;
      case Kind.partners:
        return '59'.tr;
      case Kind.apartment:
        return '49'.tr;
      case Kind.house:
        return '50'.tr;
      case Kind.roof:
        return '52'.tr;
      case Kind.solo:
        return '53'.tr;
      case Kind.pinthouse:
        return '54'.tr;
      case Kind.garden:
        return '55'.tr;
      case Kind.studio:
        return '56'.tr;
      case Kind.personal:
        return '57'.tr;
      case Kind.basement:
        return '51'.tr;
    }
  }
}

Map<States, String> categoryStates = {
  States.center: '43'.tr,
  States.jeruzalim: '44'.tr,
  States.haifa: '45'.tr,
  States.south: '46'.tr,
  States.north: '47'.tr,
  States.telAviv: '48'.tr,
};

extension DistictExtension on States {
  String get statesValue {
    switch (this) {
      case States.center:
        return '43'.tr;
      case States.jeruzalim:
        return '44'.tr;
      case States.haifa:
        return '45'.tr;
      case States.south:
        return '46'.tr;
      case States.north:
        return '47'.tr;
      case States.telAviv:
        return '48'.tr;
    }
  }
}

class Expense {
  Expense({
    required this.house,
  });

  final Kind house;
}
