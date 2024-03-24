import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'translation_and_commentary.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class TranslationAndCommentary {
  @JsonKey(name: 'id')
  @HiveField(0)
  int id;
  @JsonKey(name: 'description')
  @HiveField(1)
  String description;
  @JsonKey(name: 'author_name')
  @HiveField(2)
  String authorName;
  @JsonKey(name: 'language')
  @HiveField(3)
  String language;
  TranslationAndCommentary({
    required this.id,
    required this.description,
    required this.authorName,
    required this.language,
  });

  
  factory TranslationAndCommentary.fromJson(Map<String, dynamic> json) =>
      _$TranslationAndCommentaryFromJson(json);

  Map<String, dynamic> toJson() => _$TranslationAndCommentaryToJson(this);
}
