import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/screens/home/model/news_model.dart';

class ApiHelper {
  Future<MainModel> apiCaller() async {
    Uri uri = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=555fdd11834a462c8cb7e246598ca3b2");
    var response = await http.get(uri);
    var json = jsonDecode(response.body);

    MainModel mainModel = MainModel().mainFromJson(json);

    return mainModel;
  }
}
