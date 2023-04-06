import 'package:flutter/material.dart';
import 'package:news_app/screens/details_screen/view/details_view.dart';
import 'package:news_app/screens/home/provider/news_provider.dart';
import 'package:news_app/screens/home/view/news_view.dart';
import 'package:news_app/screens/web_view/view/web_view.dart';
import 'package:news_app/utils/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewsProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: 'splash',
        // home: NewsView(),
        routes: {
          '/': (context) => NewsView(),
          'splash': (context) => Splash(),
          'detail': (context) => DetailView(),
          'web': (context) => WebView(),
        },
      ),
    ),
  );
}