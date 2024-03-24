import 'package:bhagawad_geeta/model/chapter.dart';
import 'package:bhagawad_geeta/model/translation_and_commentary.dart';
import 'package:bhagawad_geeta/model/verses.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class HiveService {
  HiveService._internal();

  static HiveService get instance => HiveService._internal();

  Future<Box<T>> openBox<T>(String name) async {
    await Hive.initFlutter();
    if (!(Hive.isAdapterRegistered(1))) {
      Hive.registerAdapter(ChapterAdapter());
    }
    if (!(Hive.isAdapterRegistered(2))) {
      Hive.registerAdapter(TranslationAndCommentaryAdapter());
    }
    if (!(Hive.isAdapterRegistered(3))) {
      Hive.registerAdapter(VerseAdapter());
    }
    if (!(Hive.isBoxOpen(name))) {
      return await Hive.openBox<T>(name);
    }
    return Hive.box<T>(name);
  }

  Future<void> storeChapters(List<Chapter> datas) async {
    final box = await openBox<Chapter>('chapters');
    await box.addAll(datas);
  }

  Future<void> storeVerses(List<Verse> datas, String chapterId) async {
    final box = await openBox<List<Verse>>('verses');
    await box.put(chapterId, datas);
  }

  Future<List<Chapter>> getChapters() async {
    final box = await openBox<Chapter>('chapters');
    return box.values.cast<Chapter>().toList();
  }

  Future<List<Verse>> getVerse(String chapterId) async {
    final box = await openBox<List<Verse>>('verses');
    List<Verse> value = (box.get(chapterId) ?? []).cast<Verse>();
    return value;
  }
}
