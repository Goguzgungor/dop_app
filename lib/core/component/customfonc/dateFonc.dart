import 'package:intl/intl.dart';

class DateFonc {
  dateConvert(String date) {
    return DateFormat.d().format(DateTime.parse(date));
  }

  monthConvert(String date) {
    String currentMonth = DateFormat.M().format(DateTime.parse(date));
    Map monthMap = {
      '1': 'Ocak',
      '2': 'Şubat',
      '3': 'Mart',
      '4': 'Nisan',
      '5': 'Mayıs',
      '6': 'Haziran',
      '7': 'Temmuz',
      '8': 'Ağustos',
      '9': 'Eylül',
      '10': 'Ekim',
      '11': 'Kasım',
      '12': 'Aralık',
    };
    return monthMap[currentMonth];
  }

  String dateNameConvert(int date) {
    Map dayMap = {
      0: 'Pazartesi',
      1: 'Salı',
      2: 'Çarşamba',
      3: 'Perşembe',
      4: 'Cuma',
      5: 'Cumartesi',
      6: 'Pazar',
    };
    return dayMap[date];
  }

  String hoursConvert(String date) {
    String hours = DateFormat.H().format(DateTime.parse(date));
    return hours;
  }

  String minuteConvert(String date) {
    String minute = DateFormat.m().format(DateTime.parse(date));
    return minute;
  }

  String replace(String text, String findtext, String replace) {
    String newText = text.replaceAll(findtext, replace);
    return newText;
  }

  String getState(String place) {
    int lenght = place.length;
    int index = place.indexOf('/');
    return place.replaceRange(index, lenght, '');
  }

  String getCity(String place) {
    int index = place.indexOf('/') + 1;
    return place.replaceRange(0, index, '');
  }
}
