import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:quran_mobile_app/models/verse_model.dart';

class SurahModel {
  int number;
  int numberOfVerses;
  SurahRevelationModel revelation;
  SurahNameModel name;
  List<VerseModel>? verses;

  SurahModel({
    required this.number,
    required this.numberOfVerses,
    required this.revelation,
    required this.name,
    this.verses,
  });

  SurahModel copyWith({
    int? number,
    int? numberOfVerses,
    SurahRevelationModel? revelation,
    SurahNameModel? name,
    List<VerseModel>? verses,
  }) {
    return SurahModel(
      number: number ?? this.number,
      numberOfVerses: numberOfVerses ?? this.numberOfVerses,
      revelation: revelation ?? this.revelation,
      name: name ?? this.name,
      verses: verses ?? this.verses,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
      'numberOfVerses': numberOfVerses,
      'revelation': revelation.toMap(),
      'name': name.toMap(),
      'verses': verses?.map((x) => x.toMap()).toList(),
    };
  }

  factory SurahModel.fromMap(Map<String, dynamic> map) {
    return SurahModel(
      number: map['number'] as int,
      numberOfVerses: map['numberOfVerses'] as int,
      revelation: SurahRevelationModel.fromMap(
          map['revelation'] as Map<String, dynamic>),
      name: SurahNameModel.fromMap(map['name'] as Map<String, dynamic>),
      verses: map['verses'] != null
          ? List<VerseModel>.from(
              (map['verses'] as List<dynamic>).map<VerseModel?>(
                (x) => VerseModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SurahModel.fromJson(String source) =>
      SurahModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SurahModel(number: $number, numberOfVerses: $numberOfVerses, revelation: $revelation, name: $name, verses: $verses)';
  }

  @override
  bool operator ==(covariant SurahModel other) {
    if (identical(this, other)) return true;

    return other.number == number &&
        other.numberOfVerses == numberOfVerses &&
        other.revelation == revelation &&
        other.name == name &&
        listEquals(other.verses, verses);
  }

  @override
  int get hashCode {
    return number.hashCode ^
        numberOfVerses.hashCode ^
        revelation.hashCode ^
        name.hashCode ^
        verses.hashCode;
  }
}

class SurahNameModel {
  String short;
  SurahTransliterationModel transliteration;
  SurahTranslationModel translation;

  SurahNameModel({
    required this.short,
    required this.transliteration,
    required this.translation,
  });

  SurahNameModel copyWith({
    String? short,
    SurahTransliterationModel? transliteration,
    SurahTranslationModel? translation,
  }) {
    return SurahNameModel(
      short: short ?? this.short,
      transliteration: transliteration ?? this.transliteration,
      translation: translation ?? this.translation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'short': short,
      'transliteration': transliteration.toMap(),
      'translation': translation.toMap(),
    };
  }

  factory SurahNameModel.fromMap(Map<String, dynamic> map) {
    return SurahNameModel(
      short: map['short'] as String,
      transliteration: SurahTransliterationModel.fromMap(
          map['transliteration'] as Map<String, dynamic>),
      translation: SurahTranslationModel.fromMap(
          map['translation'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory SurahNameModel.fromJson(String source) =>
      SurahNameModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SurahNameModel(short: $short, transliteration: $transliteration, translation: $translation)';

  @override
  bool operator ==(covariant SurahNameModel other) {
    if (identical(this, other)) return true;

    return other.short == short &&
        other.transliteration == transliteration &&
        other.translation == translation;
  }

  @override
  int get hashCode =>
      short.hashCode ^ transliteration.hashCode ^ translation.hashCode;
}

class SurahTransliterationModel {
  String en;
  String id;

  SurahTransliterationModel({
    required this.en,
    required this.id,
  });

  SurahTransliterationModel copyWith({
    String? en,
    String? id,
  }) {
    return SurahTransliterationModel(
      en: en ?? this.en,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'en': en,
      'id': id,
    };
  }

  factory SurahTransliterationModel.fromMap(Map<String, dynamic> map) {
    return SurahTransliterationModel(
      en: map['en'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SurahTransliterationModel.fromJson(String source) =>
      SurahTransliterationModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SurahTransliterationModel(en: $en, id: $id)';

  @override
  bool operator ==(covariant SurahTransliterationModel other) {
    if (identical(this, other)) return true;

    return other.en == en && other.id == id;
  }

  @override
  int get hashCode => en.hashCode ^ id.hashCode;
}

class SurahTranslationModel {
  String en;
  String id;

  SurahTranslationModel({
    required this.en,
    required this.id,
  });

  SurahTranslationModel copyWith({
    String? en,
    String? id,
  }) {
    return SurahTranslationModel(
      en: en ?? this.en,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'en': en,
      'id': id,
    };
  }

  factory SurahTranslationModel.fromMap(Map<String, dynamic> map) {
    return SurahTranslationModel(
      en: map['en'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SurahTranslationModel.fromJson(String source) =>
      SurahTranslationModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SurahTranslationModel(en: $en, id: $id)';

  @override
  bool operator ==(covariant SurahTranslationModel other) {
    if (identical(this, other)) return true;

    return other.en == en && other.id == id;
  }

  @override
  int get hashCode => en.hashCode ^ id.hashCode;
}

class SurahRevelationModel {
  String arab;
  String id;
  String en;

  SurahRevelationModel({
    required this.arab,
    required this.id,
    required this.en,
  });

  SurahRevelationModel copyWith({
    String? arab,
    String? id,
    String? en,
  }) {
    return SurahRevelationModel(
      arab: arab ?? this.arab,
      id: id ?? this.id,
      en: en ?? this.en,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'arab': arab,
      'id': id,
      'en': en,
    };
  }

  factory SurahRevelationModel.fromMap(Map<String, dynamic> map) {
    return SurahRevelationModel(
      arab: map['arab'] as String,
      id: map['id'] as String,
      en: map['en'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SurahRevelationModel.fromJson(String source) =>
      SurahRevelationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SurahRevelationModel(arab: $arab, id: $id, en: $en)';

  @override
  bool operator ==(covariant SurahRevelationModel other) {
    if (identical(this, other)) return true;

    return other.arab == arab && other.id == id && other.en == en;
  }

  @override
  int get hashCode => arab.hashCode ^ id.hashCode ^ en.hashCode;
}
