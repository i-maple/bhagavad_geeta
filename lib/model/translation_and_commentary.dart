import 'package:json_annotation/json_annotation.dart';

part 'translation_and_commentary.g.dart';

@JsonSerializable()
class TranslationAndCommentary {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'author_name')
  String authorName;
  @JsonKey(name: 'language')
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
