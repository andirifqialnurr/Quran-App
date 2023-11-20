import 'package:quran_mobile_app/models/prayer_time_model.dart';
import 'package:quran_mobile_app/utils/api.dart';

class PrayerTimeRepository {
  Future<PrayerTimeModel> listPrayerTime() async {
    final res = await API().getPrayerTime();
    final data = res.data['data'][0]['timings'] as Map<String, dynamic>;
    return PrayerTimeModel.fromJson(
        data); // Sesuaikan dengan konversi yang sesuai
  }
}
