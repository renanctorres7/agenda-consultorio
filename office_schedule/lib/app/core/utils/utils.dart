class Utils {
  static String extractNumberString(String text) {
    RegExp regex = RegExp(r'\d+');
    Iterable<RegExpMatch> matches = regex.allMatches(text);
    List<String> numbers = [];
    for (RegExpMatch match in matches) {
      numbers.add(match.group(0)!);
    }
    return numbers.join('').toString();
  }
}
