class NameFormatter{
  static String extractLastName({required String fullName}) {
    List<String> words = fullName.split(' ');
    return words.last;
  }

  static String extractLastDoubleUpperCharacter({required String lastName}) {
    String doubleChar = '';
    List<String> words = lastName.split(' ');
    switch(words.length){
      case 1:
        doubleChar = words.first.substring(0, 1);
        break;
      case 2:
        doubleChar = words.first.substring(0, 1) + words.last.substring(0, 1);
        break;
      default:
        doubleChar = words[words.length - 1].substring(0, 1) + words[words.length - 2].substring(0, 1);
        break;
    }

    return doubleChar;
  }
}