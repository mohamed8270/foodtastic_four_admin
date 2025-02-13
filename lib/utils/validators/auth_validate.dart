import 'package:foodtastic_four_admin/utils/constants/pages.dart';

class AuthValidate {
  RegExp get alphabets => RegExp(r'^[a-zA-Z]+$');
  RegExp get email => RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}');
  RegExp get password => RegExp(r'(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])');

  // name check
  String? validateName(String? value) {
    if(value == null || value.isEmpty) {
      return FAppText.fillFields;
    } else if (value.length < 4) {
      return FAppText.nameTooShort;
    } else  if (!alphabets.hasMatch(value)) {
      return FAppText.alphabetsOnly;
    }
    return null;
  }

  String? validateEmail(String? value) {
    if(value == null || value.isEmpty) {
      return FAppText.fillFields;
    } else if(!email.hasMatch(value)) {
      return FAppText.emailError;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if(value == null || value.isEmpty) {
      return FAppText.fillFields;
    } else if(value.length < 8) {
      return FAppText.passLenError;
    } else if(!password.hasMatch(value)) {
      return FAppText.passError;
    }
    return null;
  }

}