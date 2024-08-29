import 'dart:math';

class DateGenerator{
  static DateTime randomDateTime() {
    final random = Random();
    final now = DateTime.now();

    final month = random.nextInt(12) + 1; /// Random month between 1 and 12
    final day = random.nextInt(31) + 1; /// Random day between 1 and 31
    final hour = random.nextInt(24); /// Random hour between 0 and 23

    final dateTime = DateTime(2024, month, day, hour);

    if (dateTime.isAfter(now)) {
      return randomDateTime();
    }

    return dateTime;
  }
}