class DateTimeFormatUtils {
  /// "dd de MMMM de YYYY | HH mm"
  static String dateLongWithHour(String dateTime) {
    return "${dateTime.substring(8, 10)} de ${monthName(dateTime.substring(5, 7)).toLowerCase()} de ${dateTime.substring(0, 4)} | ${dateTime.substring(11, 16).replaceFirst(':', 'h')}";
  }

  static String monthName(String month) {
    switch (month) {
      case "01":
        return "Janeiro";
      case "02":
        return "Fevereiro";
      case "03":
        return "Março";
      case "04":
        return "Abril";
      case "05":
        return "Maio";
      case "06":
        return "Junho";
      case "07":
        return "Julho";
      case "08":
        return "Agosto";
      case "09":
        return "Setembro";
      case "10":
        return "Outubro";
      case "11":
        return "Novembro";
      case "12":
      default:
        return "Dezembro";
    }
  }
}
