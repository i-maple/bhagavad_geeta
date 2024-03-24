import 'dart:convert';
import 'package:bhagawad_geeta/model/chapter.dart';
import 'package:bhagawad_geeta/model/verses.dart';
import 'package:bhagawad_geeta/service/hive_service.dart';
import 'package:bhagawad_geeta/service/keys.dart';
import 'package:http/http.dart' as http;

class Returnable<T, U> {
  T? onSuccess;
  U? onFailure;
  Returnable({
    this.onSuccess,
    this.onFailure,
  });
}

class HttpService {
  HttpService._internal();
  static HttpService get instance => HttpService._internal();

  final String baseUrl = 'https://bhagavad-gita3.p.rapidapi.com/v2/';

  final HiveService _hiveInstance = HiveService.instance;

  Future<Returnable<http.Response, Object>> request(String endPoint) async {
    Returnable<http.Response, Object> returnable = Returnable();
    try {
      http.Response response = await http.get(
        Uri.parse('$baseUrl$endPoint'),
        headers: ApiKeys.headers,
      );
      returnable.onSuccess = response;
    } catch (e) {
      returnable.onFailure = e;
    }
    return returnable;
  }

  Future<List<Chapter>> getChapters() async {
    List<Chapter> chapters = await _hiveInstance.getChapters();
    if (chapters.isNotEmpty) {
      return chapters;
    }
    Returnable<http.Response, Object> ret = await request('chapters/');
    if (ret.onSuccess != null) {
      http.Response res = ret.onSuccess!;
      if (res.statusCode == 200) {
        String responseAsJson = utf8.decode(res.bodyBytes);
        List<dynamic> responseMap = jsonDecode(responseAsJson);
        List<Chapter> chapters =
            responseMap.map((e) => Chapter.fromJson(e)).toList();
        await _hiveInstance.storeChapters(chapters);
        return chapters;
      }
    }
    print(ret.onFailure.toString());
    return [];
  }

  Future<List<Verse>> getVerses(int chapter) async {
    List<Verse> verses = await _hiveInstance.getVerse(chapter.toString());
    if (verses.isNotEmpty) {
      return verses;
    }
    Returnable<http.Response, Object> ret =
        await request('chapters/$chapter/verses/');
    if (ret.onSuccess != null) {
      http.Response res = ret.onSuccess!;
      if (res.statusCode == 200) {
        String responseAsJson = utf8.decode(res.bodyBytes);
        List<dynamic> responseMap = jsonDecode(responseAsJson);
        List<Verse> verses = responseMap.map((e) => Verse.fromJson(e)).toList();
        await _hiveInstance.storeVerses(
          verses,
          chapter.toString(),
        );
        return verses;
      }
    }
    print(ret.onFailure.toString());
    return [];
  }
}
