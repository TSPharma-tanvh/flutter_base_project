class CurrencyFormatter{
  static String format({required double value}){
    // TODO: Convert to string and remove decimal part
    String formattedValue = value.toStringAsFixed(0);

    // TODO: Split into individual characters and reverse the list
    List<String> parts = List.from(formattedValue.split('').reversed);

    // TODO: Add a dot every 3 characters starting from the fourth character
    List<String> result = [];
    for (int i = 0; i < parts.length; i++) {
      if (i != 0 && i % 3 == 0) {
        result.add('.');
      }
      result.add(parts[i]);
    }

    return '${result.reversed.join()}đ';
  }
}