import 'package:flutter/material.dart';

import 'MainPageAssist.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MainPageState();
}

class MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  MainPageAssist _mainPageAssist;
  TabController _tabController;

  @override
  void initState() {
    _mainPageAssist = MainPageAssist();
    _tabController =
        TabController(vsync: this, length: _mainPageAssist.topTabItems.length);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: _mainPageAssist.buildTabs(),
                controller: _tabController,
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: _mainPageAssist.buildContent(),
            )));
  }
}
