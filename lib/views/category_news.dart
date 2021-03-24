import 'package:flutter/material.dart';
import 'package:i_news/helper/news.dart';
import 'package:i_news/models/article_model.dart';

import 'article_view.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({this.category});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = new List<ArticleModel>();
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getCategoryNews(widget.category);
    articles = newsClass.news;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "i",
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              "NEWS",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 30, top: 20),
            child: Text(
              widget.category.toUpperCase(),
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.bold,
                // fontSize: 20,
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      // Blogs
      body: loading
          ?
          // Loading indicator
          Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          :
          // Category News Container
          SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                        itemCount: articles.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return BlogTile(
                            imageUrl: articles[index].urlToImage,
                            title: articles[index].title,
                            desc: articles[index].description,
                            url: articles[index].url,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;
  BlogTile(
      {@required this.imageUrl,
      @required this.title,
      @required this.desc,
      @required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView(
              blogUrl: url,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
            SizedBox(
              height: 4,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              desc,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Divider(
              height: 20,
              thickness: 2,
              indent: 0,
              endIndent: 0,
            ),
          ],
        ),
      ),
    );
  }
}
