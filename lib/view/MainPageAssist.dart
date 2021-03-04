import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/view/entity/TopTobItem.dart';

import 'MainSubPage.dart';

class MainPageAssist implements OnTabClickListener {
  List<String> listTitle = [
    "新闻",
    "推荐",
    "娱乐",
    "体育",
  ];
  List<Widget> listWidget = [
    //Center(child: Text("新闻")),
    MainSubPage(),
    Center(child: Text("推荐")),
    Center(child: Text("娱乐")),
    Center(child: Text("体育")),
  ];

  List<TopTabItem> topTabItems;

  MainPageAssist(){
    topTabItems = buildTopTabItems();
  }


  @override
  onTap(int index) {
    print('index:$index');
  }
  
  List<TopTabItem> buildTopTabItems() {
    var list = List<TopTabItem>();
    for (var i = 0; i < listTitle.length; i++) {
      var tabItem = TopTabItem();
      tabItem.itemWidget = listWidget[i];
      tabItem.title = listTitle[i];
      list.add(tabItem);
    }
    return list;
  }

  List<Widget> buildTabs() {
    var list = List<Widget>();
    for (var i = 0; i < topTabItems.length; i++) {
      var widget = Tab(text: topTabItems[i].title);
      list.add(widget);
    }
    return list;
  }

  List<Widget> buildContent() {
    var list = List<Widget>();
    for (var i = 0; i < topTabItems.length; i++) {
      var contentWidget = topTabItems[i].itemWidget;
      list.add(contentWidget);
    }
    return list;
  }

  void getNet_3() async {
    Dio dio = new Dio();
    //var response = await dio.get(url_3);
    //_content = response.data.toString();
  }


}

abstract class OnTabClickListener {
  onTap(int index);
}
