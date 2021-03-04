import 'package:flutter/material.dart';

class VideoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new VideoPageState();
}

class VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('视频'),
            centerTitle: true,
          ),
          body: Center(
            child: Text('视频'),
          )
      ),

    );
  }
}