import 'dart:math';

class CodeGenerator{
  static String randomCodeWithPrefix({required int length}){
    /// Generate N(length) random numbers (0-9)
    String randomNumbers = List.generate(length, (index) => Random().nextInt(10)).join('');

    /// Prefix the random numbers with '#'
    String randomCode = '#$randomNumbers';

    return randomCode;
  }

  static String randomCodeWithLetter({required int length}){
    /// List of uppercase characters (A-Z)
    List<String> uppercaseChars = List.generate(26, (index) => String.fromCharCode('A'.codeUnitAt(0) + index));

    /// Randomly select an uppercase character
    String firstRandomChar = uppercaseChars[Random().nextInt(26)];

    /// Generate N(length) random numbers (0-9)
    String randomNumbers = List.generate(length - 1, (index) => Random().nextInt(10)).join('');

    /// Concatenate the first uppercase character with the remaining numbers
    String randomCode = '$firstRandomChar$randomNumbers';

    return randomCode;
  }

  static String randomVoucherCode(){
    final random = Random();

    /// Generate random 2 letter
    final letters = List.generate(2, (index) => String.fromCharCode(random.nextInt(26) + 65));

    /// Generate random 2 number
    final numbers = List.generate(2, (index) => random.nextInt(10));

    /// Generate 3 random letters or numbers
    final mix = List.generate(3, (index) {
      if (random.nextBool()) {
        return String.fromCharCode(random.nextInt(26) + 65);
      } else {
        return random.nextInt(10).toString();
      }
    });

    /// Combine letters and numbers into a single string
    final randomString = '${letters.join('')}${numbers.join('')}${mix.join('')}';

    return randomString;
  }
}