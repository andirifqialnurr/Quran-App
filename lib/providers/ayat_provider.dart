import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quran_mobile_app/models/surah_model.dart';

import '../data/quran_repository.dart';

class AyatProvider extends ChangeNotifier {
  SurahModel? _surah;
  SurahModel? get surah => _surah;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _initialized = false;
  bool get initialized => _initialized;

  Future getDetailSurah(String id) async {
    _isLoading = true;
    try {
      final result = await QuranRepository().detailSurah(id);
      _surah = SurahModel.fromMap(result);
      _isLoading = false;
      _initialized = true;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }
}
