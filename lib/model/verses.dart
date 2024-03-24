import 'package:bhagawad_geeta/model/translation_and_commentary.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verses.g.dart';

@JsonSerializable()
@HiveType(typeId: 3)
class Verse {
  @JsonKey(name: 'id')
  @HiveField(0)
  int id;
  @JsonKey(name: 'verse_number')
  @HiveField(1)
  int verseNumber;
  @JsonKey(name: 'chapter_number')
  @HiveField(2)
  int chapterNumber;
  @JsonKey(name: 'text')
  @HiveField(3)
  String text;
  @JsonKey(name: 'translations')
  @HiveField(4)
  List<TranslationAndCommentary> translation;
  @JsonKey(name: 'commentaries')
  @HiveField(5)
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
