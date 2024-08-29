import 'package:intl/intl.dart';

class DateTimeFormatter {
  static const String dateFormatHourMinute = 'HH:mm';
  static const String dateFormatDayMonth = 'dd/MM';
  static const String dateFormatMonthYear = 'MM/yyyy';
  static const String dateFormatDayMonthYear = 'dd/MM/yyyy';
  static const String dateFormatDayMonthShortYear= 'dd/MM/yy';
  static const String dateFormatFull= 'hh:mm dd/MM/yyyy';

  /// Parse a DateTime String
  static DateTime parse({required String dateString}) {
    List<String> parts = dateString.split('/');
    if (parts.length == 3) {
      int day = int.parse(parts[0]);
      int month = int.parse(parts[1]);
      int year = int.parse(parts[2]);
      if (year >= 0 && year <= 99) {
        year += 2000;
      }
      return DateTime(year, month, day);
    } else {
      throw const FormatException("Invalid date format");
    }
  }

  /// Parse a Time String and convert it to Date Time
  static DateTime parseTimeFromString({required String timeString, required DateTime date}) {
    int hours = int.parse(timeString.substring(0, 2));
    int minutes = int.parse(timeString.substring(3, 5));
    return DateTime(date.year, date.month, date.day, hours, minutes);
  }

  /// Parse a Specific Date Delivered
  static DateTime parseDateFromDateDeliver({required String dateDelivered}) {
    /// Extract date string from input
    String dateString = dateDelivered.split('(')[1].split(')')[0];
    // log('dateString = $dateString');

    /// Parse date string to DateTime
    return DateFormat(dateFormatDayMonth).parse(dateString);
  }

  /// Parse a Specific Time Delivered
  static DateTime parseTimeFromDateDeliver({required String timeDelivered}) {
    /// Extract time string from input
    String timeString = timeDelivered.split(' - ')[1];
    timeString = timeString.replaceFirst('h', ':');
    // log('timeString = $timeString');
    /// Parse time string to DateTime
    return DateFormat(dateFormatHourMinute).parse(timeString);
  }

  /// Format DateTime only Month and Year
  static String formatMonthYear({required DateTime date}) {
    return formatDate(date: date,format: dateFormatMonthYear);
  }

  /// Format DateTime
  static String formatDayMonthYear({required DateTime date}) {
    return formatDate(date: date, format: dateFormatDayMonthYear);
  }

  /// Format DateTime with Short Year
  static String formatDayMonthShortYear({required DateTime date}) {
    return formatDate(date: date, format: dateFormatDayMonthShortYear);
  }

  /// Format DateTime include Time
  static String formatFullDay({required DateTime date}) {
    return formatDate(date: date, format: dateFormatFull);
  }

  /// Format Specific DateTime
  static String formatTimeDelivered({required DateTime dateTime}) {
    // log('datetime = $dateTime');
    /// Format the DateTime to 'dd/MM' (day/month)
    String formattedDate = formatDate(date: dateTime, format: dateFormatDayMonth);

    /// Get the day of the week as a number (1 for Monday, 7 for Sunday)
    int dayOfWeek = dateTime.weekday;

    /// Map the number to the corresponding Vietnamese day of the week
    String vietnameseDayOfWeek = [
      'Thứ hai',
      'Thứ ba',
      'Thứ tư',
      'Thứ năm',
      'Thứ sáu',
      'Thứ bảy',
      'Chủ nhật',
    ][dayOfWeek - 1]; /// Subtract 1 because DateTime's weekday starts from 1

    /// Format the result string
    return '$vietnameseDayOfWeek ($formattedDate)';
  }

  /// Custom Format Datetime
  static String formatDate({required DateTime date, required String format}) {
    String day = date.day.toString().padLeft(2, '0');
    String month = date.month.toString().padLeft(2, '0');
    String year = date.year.toString();
    if (format == dateFormatDayMonth) {
      return '$day/$month';
    }
    else if (format == dateFormatMonthYear){
      return '$month/$year';
    }
    else if (format ==dateFormatDayMonthYear) {
      return '$day/$month/$year';
    }
    else if (format == dateFormatDayMonthShortYear) {
      return '$day/$month/${year.substring(2)}';
    }
    else if (format == dateFormatFull) {
      String hour = date.hour.toString().padLeft(2, '0');
      String minute = date.minute.toString().padLeft(2, '0');
      return '$hour:$minute $day/$month/$year';
    } else {
      throw ArgumentError("Unsupported date format");
    }
  }
}