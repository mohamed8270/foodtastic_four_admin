import 'package:foodtastic_four_admin/utils/constants/pages.dart';

class FoodValidate {

  RegExp get alphabets => RegExp(r'^[a-zA-Z]+$');
  RegExp get numbers => RegExp(r'^[0-9]+$');

  // name check
  String? validateFoodName(String? value) {
    if(value == null || value.isEmpty) {
      return FAppText.fillFields;
    } else if (value.length < 2) {
      return FAppText.nameTooShort;
    } else  if (!alphabets.hasMatch(value)) {
      return FAppText.alphabetsOnly;
    }
    return null;
  }

  // description check
  String? validateDescription(String? value) {
    if(value == null || value.isEmpty) {
      return FAppText.fillFields;
    } else if (value.length < 20) {
      return FAppText.nameTooShort;
    } else  if (!alphabets.hasMatch(value)) {
      return FAppText.alphabetsOnly;
    }
    return null;
  }

  // check prepared min
  String? validateFoodNumber(String? value) {
    if(value == null) {
      return FAppText.fillFields;
    } else if(!numbers.hasMatch(value)) {
      return FAppText.numbersOnly;
    }
    return null;
  }
}