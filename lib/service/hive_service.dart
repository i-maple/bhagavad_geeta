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
      Hive.registerAdapter<Chapter>(ChapterAdapter());
    }
    if (!(Hive.isAdapterRegistered(2))) {
      Hive.registerAdapter<TranslationAndCommentary>(
          TranslationAndCommentaryAdapter());
    }
    if (!(Hive.isAdapterRegistered(3))) {
      Hive.registerAdapter<Verse>(VerseAdapter());
    }
    if (!(Hive.isBoxOpen(name))) {
      return await Hive.openBox<T>(name);
    }
    return Hive.box<T>(name);
  }

  Future<void> add<T>({required List<T> datas, required String boxName}) async {
    try {
      final box = await openBox<T>(boxName);
      await box.addAll(datas);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<T>> get<T>(String boxName) async {
    try {
      final box = await openBox<T>(boxName);
      return box.values.cast<T>().toList();
    } catch (e) {
      rethrow;
    }
  }
}
