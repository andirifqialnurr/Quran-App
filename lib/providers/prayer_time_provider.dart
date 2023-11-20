import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:quran_mobile_app/data/prayer_time_repository.dart';
import 'package:quran_mobile_app/models/prayer_time_model.dart';

class PrayerTimeProvider extends ChangeNotifier {
  PrayerTimeModel? _prayerTimes;
  PrayerTimeModel? get prayerTimes => _prayerTimes;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _initialized = false;
  bool get initialized => _initialized;

  Future<void> getPrayerTimes() async {
    try {
      _isLoading = true;

      final repository = PrayerTimeRepository();
      final prayerTimes = await repository.listPrayerTime();
      _prayerTimes = prayerTimes;

      _isLoading = false;
      _initialized = true;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      log(e.toString());
    }
  }
}
