import 'package:flutter/material.dart';
import 'package:news_app/screens/home/provider/news_provider.dart';
import 'package:provider/provider.dart';

class DetailView extends StatefulWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  int? index;

  NewsProvider? proTrue;
  NewsProvider? proFalse;

  @override
  Widget build(BuildContext context) {
    proTrue = Provider.of<NewsProvider>(context, listen: true);
    proFalse = Provider.of<NewsProvider>(context, listen: false);
    index = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.white,
              alignment: Alignment.center,
              child: Image.network(
                  "${proTrue!.mainModel!.articles![index!].urlToImage}"),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Published by :- ${proTrue!.mainModel!.articles![index!].source!.name}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Published at :- ${proTrue!.mainModel!.articles![index!].publishedAt}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Author name :- ${proTrue!.mainModel!.articles![index!].author}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${proTrue!.mainModel!.articles![index!].title}",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${proTrue!.mainModel!.articles![index!].description}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${proTrue!.mainModel!.articles![index!].content}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'web',arguments: proTrue!.mainModel!.articles![index!].url);
                        // proFalse!.initWeb(proTrue!.mainModel!.articles[index!].url);
                      },
                      child: Text("More info."),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.grey),),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
