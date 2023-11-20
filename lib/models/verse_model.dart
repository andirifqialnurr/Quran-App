import 'dart:convert';

class VerseModel {
  VerseTextModel text;
  VerseAudioModel audio;
  VerseTranslationModel translation;
  VerseNumberModel number;

  VerseModel({
    required this.text,
    required this.audio,
    required this.translation,
    required this.number,
  });

  VerseModel copyWith({
    VerseTextModel? text,
    VerseAudioModel? audio,
    VerseTranslationModel? translation,
    VerseNumberModel? number,
  }) {
    return VerseModel(
      text: text ?? this.text,
      audio: audio ?? this.audio,
      translation: translation ?? this.translation,
      number: number ?? this.number,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text.toMap(),
      'audio': audio.toMap(),
      'translation': translation.toMap(),
      'number': number.toMap(),
    };
  }

  factory VerseModel.fromMap(Map<String, dynamic> map) {
    return VerseModel(
      text: VerseTextModel.fromMap(map['text'] as Map<String, dynamic>),
      audio: VerseAudioModel.fromMap(map['audio'] as Map<String, dynamic>),
      translation: VerseTranslationModel.fromMap(
          map['translation'] as Map<String, dynamic>),
      number: VerseNumberModel.fromMap(map['number'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory VerseModel.fromJson(String source) =>
      VerseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VerseModel(text: $text, audio: $audio, translation: $translation, number: $number)';
  }

  @override
  bool operator ==(covariant VerseModel other) {
    if (identical(this, other)) return true;

    return other.text == text &&
        other.audio == audio &&
        other.translation == translation &&
        other.number == number;
  }

  @override
  int get hashCode {
    return text.hashCode ^
        audio.hashCode ^
        translation.hashCode ^
        number.hashCode;
  }
}

class VerseTextModel {
  String arab;

  VerseTextModel({
    required this.arab,
  });

  VerseTextModel copyWith({
    String? arab,
  }) {
    return VerseTextModel(
      arab: arab ?? this.arab,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'arab': arab,
    };
  }

  factory VerseTextModel.fromMap(Map<String, dynamic> map) {
    return VerseTextModel(
      arab: map['arab'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VerseTextModel.fromJson(String source) =>
      VerseTextModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'VerseTextModel(arab: $arab)';

  @override
  bool operator ==(covariant VerseTextModel other) {
    if (identical(this, other)) return true;

    return other.arab == arab;
  }

  @override
  int get hashCode => arab.hashCode;
}

class VerseAudioModel {
  String primary;

  VerseAudioModel({
    required this.primary,
  });

  VerseAudioModel copyWith({
    String? primary,
  }) {
    return VerseAudioModel(
      primary: primary ?? this.primary,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'primary': primary,
    };
  }

  factory VerseAudioModel.fromMap(Map<String, dynamic> map) {
    return VerseAudioModel(
      primary: map['primary'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VerseAudioModel.fromJson(String source) =>
      VerseAudioModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'VerseAudioModel(primary: $primary)';

  @override
  bool operator ==(covariant VerseAudioModel other) {
    if (identical(this, other)) return true;

    return other.primary == primary;
  }

  @override
  int get hashCode => primary.hashCode;
}

class VerseTranslationModel {
  String id;
  String en;

  VerseTranslationModel({
    required this.id,
    required this.en,
  });

  VerseTranslationModel copyWith({
    String? id,
    String? en,
  }) {
    return VerseTranslationModel(
      id: id ?? this.id,
      en: en ?? this.en,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'en': en,
    };
  }

  factory VerseTranslationModel.fromMap(Map<String, dynamic> map) {
    return VerseTranslationModel(
      id: map['id'] as String,
      en: map['en'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VerseTranslationModel.fromJson(String source) =>
      VerseTranslationModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'VerseTranslationModel(id: $id, en: $en)';

  @override
  bool operator ==(covariant VerseTranslationModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.en == en;
  }

  @override
  int get hashCode => id.hashCode ^ en.hashCode;
}

class VerseNumberModel {
  int inSurah;
  int inQuran;

  VerseNumberModel({
    required this.inSurah,
    required this.inQuran,
  });

  VerseNumberModel copyWith({
    int? inSurah,
    int? inQuran,
  }) {
    return VerseNumberModel(
      inSurah: inSurah ?? this.inSurah,
      inQuran: inQuran ?? this.inQuran,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'inSurah': inSurah,
      'inQuran': inQuran,
    };
  }

  factory VerseNumberModel.fromMap(Map<String, dynamic> map) {
    return VerseNumberModel(
      inSurah: map['inSurah'] as int,
      inQuran: map['inQuran'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory VerseNumberModel.fromJson(String source) =>
      VerseNumberModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'VerseNumberModel(inSurah: $inSurah, inQuran: $inQuran)';

  @override
  bool operator ==(covariant VerseNumberModel other) {
    if (identical(this, other)) return true;

    return other.inSurah == inSurah && other.inQuran == inQuran;
  }

  @override
  int get hashCode => inSurah.hashCode ^ inQuran.hashCode;
}
