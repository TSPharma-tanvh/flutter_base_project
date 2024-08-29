class PhoneFormatter{
  static String getPhoneNumber({required String phone}) {
    if (phone.length == 10) {
      return "${phone.substring(0, 4)} ${phone.substring(4, 7)} ${phone.substring(7)}";
    } else if (phone.length == 11) {
      return "${phone.substring(0, 4)} ${phone.substring(4, 7)} ${phone.substring(7)}";
    } else if (phone.length == 12) {
      return "${phone.substring(0, 4)} ${phone.substring(4, 8)} ${phone.substring(8)}";
    } else {
      return "Invalid phone length";
    }
  }
}