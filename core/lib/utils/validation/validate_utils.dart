part of '../../core.dart';

class ValidateUtilsCore {
  /// Checks if data is null.
  /// Checks if data is false.
  ///
  static bool userName(String value) {
    String pattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@$!%*#?&]).{2,50}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static bool validateStructure(String value) {
    String pattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@$!%*#?&]).{8,50}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static bool validateEmail(String value) {
    // String pattern =
    //     r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    String pattern =
        '^(\\s){0,}[a-zA-Z0-9_\\.-]{1,50}[a-zA-Z0-9]{1,50}@[a-zA-Z0-9-_]{2,}(\\.[a-zA-Z0-9]{2,4}){1,2}(\\s){0,}\$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static bool validatePhone(String value) {
    String pattern = r'^((\+|)[0-9]{2}[0-9]{0,18}|0[0-9]{19})\b$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static bool validatePassword(String value) {
    String pattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@$!%*#?&]).{6,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static bool validateConfirmPass(String pass, String passAgain) {
    bool samePass = false;
    if (pass == passAgain) {
      samePass = true;
    }
    return samePass;
  }

  static bool validateName(String name) {
    if (name.length > 100 || name.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  static bool validateUsername(String userName) {
    bool validateUsername = false;
    if (userName.length < 50 && userName.length > 1) {
      String pattern = r'^[a-zA-Z0-9_\.]+$';
      RegExp regExp = RegExp(pattern);
      if (regExp.hasMatch(userName) == true) {
        validateUsername = true;
      } else {
        validateUsername = false;
      }
    }
    return validateUsername;
  }

  static bool isUsernameValid(String userName) {
    RegExp regExp = RegExp(r'^[a-zA-Z0-9]{3,}$');
    return regExp.hasMatch(userName);
  }

  static bool isPasswordValid(String pw) {
    RegExp regExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[^\w\s]).{8,}$');
    return regExp.hasMatch(pw);
  }

  static bool isEmailValid(String email) {
    RegExp regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regExp.hasMatch(email);
  }

  static bool isPhoneNumberValid(String phoneNo) {
    RegExp regExp = RegExp(r'(^(?:[+0]9)?0[0-9]{9}$)');
    return regExp.hasMatch(phoneNo);
  }

  static isNullOrEmpty(dynamic object) {
    if (object == null) {
      return true;
    }
    if (object is String &&
        (object.isEmpty || (object.isNotEmpty && object.trim() == ""))) {
      return true;
    }
    if (object is List && object.isEmpty) {
      return true;
    }
    if (object is bool && object == false) {
      return true;
    }
    return false;
  }
}
