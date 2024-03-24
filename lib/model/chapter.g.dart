// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChapterAdapter extends TypeAdapter<Chapter> {
  @override
  final int typeId = 1;

  @override
  Chapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Chapter(
      id: fields[0] as int,
      name: fields[1] as String,
      nameTransliterated: fields[2] as String,
      nameTranslated: fields[3] as String,
      versesCount: fields[4] as int,
      chapterNumber: fields[5] as int,
      nameMeaning: fields[6] as String,
      chapterSummary: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Chapter obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.nameTransliterated)
      ..writeByte(3)
      ..write(obj.nameTranslated)
      ..writeByte(4)
      ..write(obj.versesCount)
      ..writeByte(5)
      ..write(obj.chapterNumber)
      ..writeByte(6)
      ..write(obj.nameMeaning)
      ..writeByte(7)
      ..write(obj.chapterSummary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chapter _$ChapterFromJson(Map<String, dynamic> json) => Chapter(
      id: json['id'] as int,
      name: json['name'] as String,
      nameTransliterated: json['name_transliterated'] as String,
      nameTranslated: json['name_translated'] as String,
      versesCount: json['verses_count'] as int,
      chapterNumber: json['chapter_number'] as int,
      nameMeaning: json['name_meaning'] as String,
      chapterSummary: json['chapter_summary'] as String,
    );

Map<String, dynamic> _$ChapterToJson(Chapter instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_transliterated': instance.nameTransliterated,
      'name_translated': instance.nameTranslated,
      'verses_count': instance.versesCount,
      'chapter_number': instance.chapterNumber,
      'name_meaning': instance.nameMeaning,
      'chapter_summary': instance.chapterSummary,
    };
