import 'package:bhagawad_geeta/model/chapter.dart';
import 'package:bhagawad_geeta/model/verses.dart';
import 'package:bhagawad_geeta/service/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'http_provider.g.dart';

@riverpod
Future<List<Chapter>> getChapter(GetChapterRef ref) {
  return HttpService.instance.getChapters();
}

@riverpod
Future<List<Verse>> getVerse(GetVerseRef ref, int verse) {
  return HttpService.instance.getVerses(verse);
}
