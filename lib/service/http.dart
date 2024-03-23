import 'dart:convert';
import 'package:bhagawad_geeta/model/chapter.dart';
import 'package:bhagawad_geeta/model/verses.dart';
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
    Returnable<http.Response, Object> ret = await request('chapters/');
    if (ret.onSuccess != null) {
      http.Response res = ret.onSuccess!;
      if (res.statusCode == 200) {
        // String responseAsJson = res.body;
        String responseAsJson = utf8.decode(res.bodyBytes);
        List<dynamic> responseMap = jsonDecode(responseAsJson);
        List<Chapter> chapters =
            responseMap.map((e) => Chapter.fromJson(e)).toList();
        return chapters;
      }
    }
    print(ret.onFailure.toString());
    return [];
  }

  Future<List<Verse>> getVerses(int chapter) async {
    Returnable<http.Response, Object> ret =
        await request('chapters/$chapter/verses/');
    if (ret.onSuccess != null) {
      http.Response res = ret.onSuccess!;
      if (res.statusCode == 200) {
        // String responseAsJson = res.body;
        String responseAsJson = utf8.decode(res.bodyBytes);
        List<dynamic> responseMap = jsonDecode(responseAsJson);
        List<Verse> verses = responseMap.map((e) => Verse.fromJson(e)).toList();
        print(verses);
        return verses;
      }
    }
    print(ret.onFailure.toString());
    return [];
  }
}
