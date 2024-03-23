// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chapter _$ChapterFromJson(Map<String, dynamic> json) => Chapter(
      id: json['id'] as int,
      nameTransliterated: json['name_transliterated'] as String,
      nameTranslated: json['name_translated'] as String,
      versesCount: json['verses_count'] as int,
      chapterNumber: json['chapter_number'] as int,
      nameMeaning: json['name_meaning'] as String,
      chapterSummary: json['chapter_summary'] as String,
    );

Map<String, dynamic> _$ChapterToJson(Chapter instance) => <String, dynamic>{
      'id': instance.id,
      'name_transliterated': instance.nameTransliterated,
      'name_translated': instance.nameTranslated,
      'verses_count': instance.versesCount,
      'chapter_number': instance.chapterNumber,
      'name_meaning': instance.nameMeaning,
      'chapter_summary': instance.chapterSummary,
    };
