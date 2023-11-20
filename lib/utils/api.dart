import 'package:dio/dio.dart';

class API {
  Dio dio = Dio();

  final apiQuran = 'https://api.quran.gading.dev';
  final apiTimes =
      "http://api.aladhan.com/v1/calendarByAddress/2023/9?address=Makassar&method=2";

  Future getQuran(String endpoint) {
    return dio.get("$apiQuran$endpoint");
  }

  Future getPrayerTime() {
    return dio.get(apiTimes);
  }
}
