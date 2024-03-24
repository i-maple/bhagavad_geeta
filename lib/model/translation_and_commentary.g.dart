// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation_and_commentary.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TranslationAndCommentaryAdapter
    extends TypeAdapter<TranslationAndCommentary> {
  @override
  final int typeId = 2;

  @override
  TranslationAndCommentary read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TranslationAndCommentary(
      id: fields[0] as int,
      description: fields[1] as String,
      authorName: fields[2] as String,
      language: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TranslationAndCommentary obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.authorName)
      ..writeByte(3)
      ..write(obj.language);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslationAndCommentaryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
