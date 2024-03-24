// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verses.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VerseAdapter extends TypeAdapter<Verse> {
  @override
  final int typeId = 3;

  @override
  Verse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Verse(
      id: fields[0] as int,
      verseNumber: fields[1] as int,
      chapterNumber: fields[2] as int,
      text: fields[3] as String,
      translation: (fields[4] as List).cast<TranslationAndCommentary>(),
      commentary: (fields[5] as List).cast<TranslationAndCommentary>(),
    );
  }

  @override
  void write(BinaryWriter writer, Verse obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.verseNumber)
      ..writeByte(2)
      ..write(obj.chapterNumber)
      ..writeByte(3)
      ..write(obj.text)
      ..writeByte(4)
      ..write(obj.translation)
      ..writeByte(5)
      ..write(obj.commentary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VerseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Verse _$VerseFromJson(Map<String, dynamic> json) => Verse(
      id: json['id'] as int,
      verseNumber: json['verse_number'] as int,
      chapterNumber: json['chapter_number'] as int,
      text: json['text'] as String,
      translation: (json['translations'] as List<dynamic>)
          .map((e) =>
              TranslationAndCommentary.fromJson(e as Map<String, dynamic>))
          .toList(),
      commentary: (json['commentaries'] as List<dynamic>)
          .map((e) =>
              TranslationAndCommentary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VerseToJson(Verse instance) => <String, dynamic>{
      'id': instance.id,
      'verse_number': instance.verseNumber,
      'chapter_number': instance.chapterNumber,
      'text': instance.text,
      'translations': instance.translation,
      'commentaries': instance.commentary,
    };
