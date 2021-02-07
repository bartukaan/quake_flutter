import 'package:intl/intl.dart';

class ServiceUrls {
  static String getBaseUrl() {
    var url = 'https://api.orhanaydogdu.com.tr/deprem';

    return url;
  }

  static String getLastQuakeWithCount(int count) {
    var url = getBaseUrl() + '/live.php?limit=$count' ;
    return url;
  }

  static String getLastQuakeWithDateAndCount(int count, DateTime time) {
    var formattedDate = DateFormat('yyyy-MM-dd').format(time);
    var url = getBaseUrl() + '/index.php?date=$formattedDate&limit=$count';
    return url;
  }
}
