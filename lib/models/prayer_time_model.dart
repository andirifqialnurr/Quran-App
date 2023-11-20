class PrayerTimeModel {
  String? fajr;
  String? sunrise;
  String? dhuhr;
  String? asr;
  String? sunset;
  String? maghrib;
  String? isha;
  String? imsak;
  String? midnight;
  String? firstthird;
  String? lastthird;

  PrayerTimeModel({
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.sunset,
    this.maghrib,
    this.isha,
    this.imsak,
    this.midnight,
    this.firstthird,
    this.lastthird,
  });

  PrayerTimeModel copyWith({
    String? fajr,
    String? sunrise,
    String? dhuhr,
    String? asr,
    String? sunset,
    String? maghrib,
    String? isha,
    String? imsak,
    String? midnight,
    String? firstthird,
    String? lastthird,
  }) {
    return PrayerTimeModel(
        fajr: fajr ?? this.fajr,
        sunrise: sunrise ?? this.sunrise,
        dhuhr: dhuhr ?? this.dhuhr,
        asr: asr ?? this.asr,
        sunset: sunset ?? this.sunset,
        maghrib: maghrib ?? this.maghrib,
        isha: isha ?? this.isha,
        imsak: imsak ?? this.imsak,
        midnight: midnight ?? this.midnight,
        firstthird: firstthird ?? this.firstthird,
        lastthird: lastthird ?? this.lastthird);
  }

  factory PrayerTimeModel.fromJson(Map<String, dynamic> json) {
    return PrayerTimeModel(
      fajr: json['Fajr'],
      sunrise: json['Sunrise'],
      dhuhr: json['Dhuhr'],
      asr: json['Asr'],
      sunset: json['Sunset'],
      maghrib: json['Maghrib'],
      isha: json['Isha'],
      imsak: json['Imsak'],
      midnight: json['Midnight'],
      firstthird: json['Firstthird'],
      lastthird: json['Lastthird'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Fajr': fajr,
      'Sunrise': sunrise,
      'Dhuhr': dhuhr,
      'Asr': asr,
      'Sunset': sunset,
      'Maghrib': maghrib,
      'Isha': isha,
      'Imsak': imsak,
      'Midnight': midnight,
      'Firstthird': firstthird,
      'Lastthird': lastthird,
    };
  }
}
