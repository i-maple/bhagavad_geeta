import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'chapter.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class Chapter {
  @JsonKey(name: 'id')
  @HiveField(0)
  int id;
  @JsonKey(name: 'name')
  @HiveField(1)
  String name;
  @JsonKey(name: 'name_transliterated')
  @HiveField(2)
  String nameTransliterated;
  @JsonKey(name: 'name_translated')
  @HiveField(3)
  String nameTranslated;
  @JsonKey(name: 'verses_count')
  @HiveField(4)
  int versesCount;
  @JsonKey(name: 'chapter_number')
  @HiveField(5)
  int chapterNumber;
  @JsonKey(name: 'name_meaning')
  @HiveField(6)
  String nameMeaning;
  @JsonKey(name: 'chapter_summary')
  @HiveField(7)
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
