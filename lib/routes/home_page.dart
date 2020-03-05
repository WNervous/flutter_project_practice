import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_practice/models/category.dart';
import 'package:flutter_project_practice/routes/list_page.dart';
import 'package:http/http.dart' as http;

class HomeTabPage extends StatefulWidget {
  HomeTabPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomeTabPage> with TickerProviderStateMixin {
  List<Category> _category = [];

  @override
  void initState() {
    super.initState();
    _category = PageStorage.of(context).readState(context, identifier: "datas");
    print("=======check storage=========");
    print(_category);
    print("=======check storage=========");
    if (_category == null || _category.isEmpty) {
      fetchPosts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
          length: _category == null ? 1 : _category.length,
          child: NestedScrollView(
              headerSliverBuilder: (context, isScroll) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 200,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      background: Image.asset(
                        "imgs/bg_star_us.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                      pinned: true,
                      delegate: _SliverAppBarDelegate(TabBar(
                        labelColor: Colors.blue,
                        isScrollable: true,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: Colors.blue,
                        tabs: buildTabs(),
                        onTap: (index) {
                          print("tab:$index");
                        },
                      ))),
                ];
              },
              body: buildBody())),
    );
  }

  Widget buildBody() {
    if (_category == null || _category.isEmpty) {
      return TabBarView(
        children: [
          Container(
            child: CircularProgressIndicator(),
          )
        ],
      );
    } else {
      return TabBarView(
        children: _category
            .map((category) => DrawingListPage(
                  id: category.id,
                ))
            .toList(),
      );
    }
  }

  List<Widget> buildTabs() {
    if (_category == null || _category.isEmpty) {
      return [
        Tab(
          text: "Default",
        )
      ];
    } else {
      return _category
          .map((category) => Tab(
                text: category.name,
              ))
          .toList();
    }
  }

  Future<dynamic> fetchPosts() {
    return http
        .get(
            'https://easydrawing-api.dailyinnovation.biz/easydrawing/v1/category')
        .then((http.Response response) {
      final List<Category> fetchedPosts = [];

      final dynamic postsData = json.decode(response.body);
      if (postsData == null) {}
      print(postsData);
      final dynamic data = postsData["data"];
      print(data);
      List<dynamic> datas = data["categoryList"];
      print(datas);
      for (var i = 0; i < datas.length; i++) {
        final Category category = Category(
          id: datas[i]["id"],
          name: datas[i]["name"],
          color: datas[i]["color"],
        );
        fetchedPosts.add(category);
      }
      PageStorage.of(context)
          .writeState(context, fetchedPosts, identifier: "datas");
      setState(() {
        _category = fetchedPosts;
      });
    }).catchError((Object error) {});
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
