import 'package:flutter/material.dart';
import 'package:news_app/screens/home/model/news_model.dart';
import 'package:news_app/utils/api_helper/api_helper.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsProvider extends ChangeNotifier{

  ApiHelper? apiHelper = ApiHelper();
  MainModel? mainModel;
  WebViewController? webViewController;

  Future<void> apiCaller() async {
    mainModel = await apiHelper!.apiCaller();
    notifyListeners();
  }

  void initWeb(String webName){
    webViewController = WebViewController();
    Uri uri = Uri();
    webViewController!.loadRequest(Uri.parse(webName));
  }
}