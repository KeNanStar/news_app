import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/com/newsflutter/view/entity/BaseNewsItem.dart';
import 'package:news_app/com/newsflutter/view/mainpage/SubPageAssist.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'module/SubPageModule.dart';

class MainSubPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainSubPageState();
}

class MainSubPageState extends State<MainSubPage> {
  //List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  List<BaseNewsItem> newsItems;
  SubPageAssist subPageAssist;

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    //items.add((items.length + 1).toString());
    var  items = subPageAssist.getNewsItemsFromServer();
    newsItems.addAll(items);
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    subPageAssist = SubPageAssist();
    newsItems = subPageAssist.getNewsItemsFromServer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("release to load more");
            } else {
              body = Text("No more Data");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
          itemBuilder: (c, i) => Card(child: Center(child: ImageNewsView(newsItems[i]))),
          itemExtent: 100.0,
          itemCount: newsItems.length,
        ),
      ),
    );
  }
}
