import 'package:flutter/material.dart';
import 'package:news_app/com/newsflutter/view/entity/BaseNewsItem.dart';
import 'package:news_app/com/newsflutter/view/entity/ImageNewsItem.dart';

class ImageNewsView extends StatefulWidget {
  ImageNewsItem item;

  ImageNewsView(BaseNewsItem item){
    this.item = item;
  }

  @override
  State<StatefulWidget> createState() => ImageNewsViewState(item);
}

class ImageNewsViewState extends State<ImageNewsView> {
  ImageNewsItem item;

  ImageNewsViewState(ImageNewsItem item){
    this.item = item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Text(item.title),
            Image(
              image: NetworkImage(item.imgUrl),
              width: 300,
              height: 200,
            )
          ],
        ),
    );

  }
}

class TextNewsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TextNewsViewState();
}

class TextNewsViewState extends State<TextNewsView> {
  @override
  Widget build(BuildContext context) {}
}

class TextImageNewsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TextImageNewsViewState();
}

class TextImageNewsViewState extends State<ImageNewsView> {
  @override
  Widget build(BuildContext context) {}
}
