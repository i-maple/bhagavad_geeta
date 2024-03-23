// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation_and_commentary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranslationAndCommentary _$TranslationAndCommentaryFromJson(
        Map<String, dynamic> json) =>
    TranslationAndCommentary(
      id: json['id'] as int,
      description: json['description'] as String,
      authorName: json['author_name'] as String,
      language: json['language'] as String,
    );

Map<String, dynamic> _$TranslationAndCommentaryToJson(
        TranslationAndCommentary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'author_name': instance.authorName,
      'language': instance.language,
    };
