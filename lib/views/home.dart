import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:i_news/helper/data.dart';
import 'package:i_news/helper/news.dart';
import 'package:i_news/models/article_model.dart';
import 'package:i_news/models/category_model.dart';
import 'package:i_news/views/article_view.dart';
import 'package:i_news/views/category_news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();

  List<ArticleModel> articles = new List<ArticleModel>();

  bool loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
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
            Text("i",
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            Text("NEWS",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ))
          ],
        ),
        actions: [
          GestureDetector(
            child: Container(
              padding: EdgeInsets.only(right: 30, top: 3),
              child: Text(
                "🇮🇳",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: loading
          ?
          // Loading indicator
          Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          :
          // News Container
          SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    // Categories
                    Container(
                      height: 70,
                      child: ListView.builder(
                        itemCount: categories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            imageUrl: categories[index].imageUrl,
                            categoryName: categories[index].categoryName,
                          );
                        },
                      ),
                    ),
                    // Blogs
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

class CategoryTile extends StatelessWidget {
  final String imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryNews(
              category: categoryName.toLowerCase(),
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 120,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black45,
              ),
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
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
