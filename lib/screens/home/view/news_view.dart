import 'package:flutter/material.dart';
import 'package:news_app/screens/home/provider/news_provider.dart';
import 'package:provider/provider.dart';

class NewsView extends StatefulWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false).apiCaller();
  }

  NewsProvider? proTrue;
  NewsProvider? proFalse;

  TextEditingController txtsearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    proTrue = Provider.of<NewsProvider>(context, listen: true);
    proFalse = Provider.of<NewsProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        // appBar: AppBar(
        //   title: Text("${proTrue!.mainModel!.articles![0].title}"),
        // ),
        body: proTrue!.mainModel!.articles! == null
            ? Container()
            : Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 55,
                width: double.infinity,
                decoration:
                BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 2,
                    blurRadius: 3,
                  ),
                ]),
                alignment: Alignment.center,
                child: TextField(
                  controller: txtsearch,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search_rounded),
                  ),
                ),
                // child: Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     // mainAxisSize: MainAxisSize.min,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Icon(Icons.search_rounded),
                //       // Divider(
                //       //   color: Colors.black,
                //       //   height: 20,
                //       //   thickness: 4,
                //       //   indent: 1,
                //       //   endIndent: 1,
                //       // ),
                //       // TextField(
                //       //
                //       //   decoration: InputDecoration(
                //       //     hintText: "Search for news",
                //       //   ),
                //       // ),
                //       SizedBox(
                //         width: 20,
                //       ),
                //       Text("Search for news"),
                //     ],
                //   ),
                // ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () =>
                          Navigator.pushNamed(
                              context, 'detail', arguments: index),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15),
                        height: 185,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.black38,
                          //     spreadRadius: 4,
                          //     blurRadius: 3,
                          //   ),
                          // ],
                          borderRadius:
                          BorderRadius.all(Radius.circular(10)),
                        ),
                        alignment: Alignment.topCenter,
                        child: Stack(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Image.network(
                                "${proTrue!.mainModel!.articles![index]
                                    .urlToImage}",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: EdgeInsets.all(7),
                                height: 68,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                ),
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${proTrue!.mainModel!.articles![index]
                                          .source!.name}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "${proTrue!.mainModel!.articles![index]
                                          .title}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Container(
                            //   height: 100,
                            //   width: double.infinity,
                            //   color: Colors.white38,
                            // ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: proTrue!.mainModel!.articles!.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
