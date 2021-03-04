import 'package:flutter/material.dart';
import 'package:news_app/com/newsflutter/view/VideoPage.dart';
import 'com/newsflutter/view/PersonPage.dart';
import 'com/newsflutter/view/mainpage/MainPage.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NewsHomePage(title: 'Flutter News'),
    );
  }
}

class NewsHomePage extends StatefulWidget {
  NewsHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NewsHomePageState createState() => _NewsHomePageState();
}

class _NewsHomePageState extends State<NewsHomePage>
    with SingleTickerProviderStateMixin {
  TabController _bottomTabController;

  @override
  void initState() {
    _bottomTabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _bottomTabController,
        children: <Widget>[MainPage(), VideoPage(), PersonPage()],
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          controller: _bottomTabController,
          labelColor: Colors.deepPurpleAccent,
          unselectedLabelColor: Colors.black26,
          tabs: <Widget>[
            new Tab(
              text: "首页",
              icon: new Icon(Icons.home),
            ),
            new Tab(
              text: "视频",
              icon: new Icon(Icons.video_label),
            ),
            new Tab(
              text: "个人",
              icon: new Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
