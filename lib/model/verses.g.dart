// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verses.dart';

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
