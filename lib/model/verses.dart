import 'package:bhagawad_geeta/model/translation_and_commentary.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verses.g.dart';

@JsonSerializable()
class Verse {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'verse_number')
  int verseNumber;
  @JsonKey(name: 'chapter_number')
  int chapterNumber;
  @JsonKey(name: 'text')
  String text;
  @JsonKey(name: 'translation')
  List<TranslationAndCommentary> translation;
  @JsonKey(name: 'commentary')
  List<TranslationAndCommentary> commentary;
  Verse({
    required this.id,
    required this.verseNumber,
    required this.chapterNumber,
    required this.text,
    required this.translation,
    required this.commentary,
  });

  factory Verse.fromJson(Map<String, dynamic> json) => _$VerseFromJson(json);

  Map<String, dynamic> toJson() => _$VerseToJson(this);
}
