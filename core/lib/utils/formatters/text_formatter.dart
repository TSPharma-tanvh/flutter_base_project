class TextFormatter{
  static String capitalizeFirstLetterOfEachWord({required String text}) {
    if (text.isEmpty) {
      return text; // Return empty string if input is empty
    }
    text = text.toLowerCase();
    return text.substring(0, 1).toUpperCase() + text.substring(1);
  }
}