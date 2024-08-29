part of '../../core.dart';

class StringUtilsCore {
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

  static String replacePathParams(String path, Map<String, String> params) {
    var result = path;
    params.forEach((key, value) {
      if (isNullOrEmpty(value)) {
        result = result.replaceAll('/{$key}', '');
      } else {
        result = result.replaceAll('{$key}', value);
      }
    });
    return result;
  }

  static String formatStringToCash({
    required dynamic cash,
    String? unit,
  }) {
    if (isNullOrEmpty(cash)) {
      return "0 VNĐ";
    }
    if (cash is String) {
      cash = double.parse(cash);
    }

    // Format the cash value using NumberFormat
    final numberFormat = NumberFormat('#,##0.000', 'en_US');
    String formattedCash = numberFormat.format(cash);

    if (cash is int || cash is double && cash == cash.round()) {
      formattedCash = NumberFormat('#,##0', 'en_US').format(cash);
    }

    if (!isNullOrEmpty(unit)) {
      formattedCash += " $unit";
    } else {
      formattedCash += " VNĐ";
    }

    return formattedCash;
  }

  static String valueText(value, {String? type, String? unit}) {
    if (type == ValueType.money.name) {
      return formatStringToCash(cash: value);
    } else if (type == ValueType.phoneNumber.name) {
      if (value is String && value.length <= 8) {
        return value
            .toString()
            .replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} ")
            .trimRight();
      }

      return value
          .toString()
          .replaceAllMapped(RegExp(r".{3}"), (match) => "${match.group(0)} ")
          .trimRight();
    } else if (type == ValueType.addUnit.name) {
      return formatStringToCash(cash: value, unit: unit);
    } else if (value is String) {
      return value;
    } else {
      return value.toString();
    }
  }

  static String pathWithQueryParams(String path, Map<String, dynamic> params) {
    String result = path;

    final Map<String, String> paramsString =
        params.map((key, value) => MapEntry(key, value.toString()));

    final queryParams = Uri(queryParameters: paramsString).query;

    if (queryParams.isNotEmpty) {
      result += '?$queryParams';
    }

    return result;
  }

  static Future<String> getEncryptToken() async {
    try {
      final tokenData = await AppSecureStorageCore.getToken();
      final secretKey = tokenData?.secretKey;
      final accessToken = tokenData?.accessToken;

      if (secretKey == null || accessToken == null) return '';
      final publicKey =
          '-----BEGIN PUBLIC KEY-----\n$secretKey\n-----END PUBLIC KEY-----';
      final tokenParts = accessToken.split('.');
      final data = "${tokenParts[0]}.${tokenParts[1]}";
      final encrypted = await RSA.encryptPKCS1v15(data, publicKey);

      return '$encrypted.${tokenParts[2]}';
    } catch (e) {
      LogUtilsCore.e(e.toString());
      return '';
    }
  }
}

enum ValueType {
  number,
  string,
  money,
  addUnit,
  phoneNumber,
  time,
  dateTime,
}
