class MainModel {
  String? status;
  int? totalResults;
  List<News>? articles = [];

  MainModel({this.status, this.totalResults, this.articles});

  MainModel mainFromJson(Map m1) {
    status = m1['status'];
    totalResults = m1['totalResults'];

   List articleList = m1['articles'];
    articles = articleList.map((e) => News().newsFromJson(e)).toList();
    // status = m1['status'];

    MainModel mainModel = MainModel(articles: articles,status: status,totalResults: totalResults);
    return mainModel;
  }
}

class News {
  String? author, title, description, url, urlToImage, publishedAt, content;
  Source? source;

  News(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content,
      this.source});

  News newsFromJson(Map m1) {
    author = m1['author'];
    title = m1['title'];
    description = m1['description'];
    url = m1['url'];
    urlToImage = m1['urlToImage'];
    publishedAt = m1['publishedAt'];
    content = m1['content'];

    source = Source().sourceFromJson(m1['source']);

    News n1 = News(
        title: title,
        description: description,
        publishedAt: publishedAt,
        content: content,
        urlToImage: urlToImage,
        url: url,
        author: author,
        source: source);
    return n1;
  }
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source sourceFromJson(Map m1) {
    id = m1['id'];
    name = m1['name'];

    Source s1 = Source(id: id, name: name);
    return s1;
  }
}
