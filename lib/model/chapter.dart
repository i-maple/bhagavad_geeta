import 'package:json_annotation/json_annotation.dart';

part 'chapter.g.dart';

@JsonSerializable()
class Chapter {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'name_transliterated')
  String nameTransliterated;
  @JsonKey(name: 'name_translated')
  String nameTranslated;
  @JsonKey(name: 'verses_count')
  int versesCount;
  @JsonKey(name: 'chapter_number')
  int chapterNumber;
  @JsonKey(name: 'name_meaning')
  String nameMeaning;
  @JsonKey(name: 'chapter_summary')
  String chapterSummary;
  Chapter({
    required this.id,
    required this.name,
    required this.nameTransliterated,
    required this.nameTranslated,
    required this.versesCount,
    required this.chapterNumber,
    required this.nameMeaning,
    required this.chapterSummary,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterToJson(this);
}
