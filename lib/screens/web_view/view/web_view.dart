import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../home/provider/news_provider.dart';

class WebView extends StatefulWidget {
  const WebView({Key? key}) : super(key: key);

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  NewsProvider? proTrue;
  NewsProvider? proFalse;

  String? webName;
  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<NewsProvider>(context,listen: false).initWeb(webName);
  // }

  @override
  Widget build(BuildContext context) {
    proTrue = Provider.of<NewsProvider>(context, listen: true);
    proFalse = Provider.of<NewsProvider>(context, listen: false);

    webName = ModalRoute.of(context)!.settings.arguments as String;

    proFalse!.initWeb(webName!);
    return SafeArea(
      child: Scaffold(
        body: WebViewWidget(controller: proFalse!.webViewController!,),
      ),
    );
  }
}
