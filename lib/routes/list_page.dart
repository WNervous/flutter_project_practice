import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_practice/models/draw.dart';
import 'package:http/http.dart' as http;

class DrawingListPage extends StatefulWidget {
  final String id;

  DrawingListPage({this.id});

  @override
  _DrawingListPageState createState() => _DrawingListPageState(id: this.id);
}

class _DrawingListPageState extends State<DrawingListPage> {
  String id;

  _DrawingListPageState({this.id});

  List<Draw> _list = [];

  @override
  void initState() {
    super.initState();
    _list = PageStorage.of(context).readState(context, identifier: id);
    if (_list == null || _list.isEmpty) {
      _fetchDraw(id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: _list == null ? 0 : _list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(15),
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                print(index);
              },
              child: Image.network(_list[index].figure),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 4,
            clipBehavior: Clip.antiAlias,
          );
        });
  }

  Future<dynamic> _fetchDraw(String id) {
    return http
        .get(
            "https://easydrawing-api.dailyinnovation.biz/easydrawing/v1/category/$id/images")
        .then((http.Response response) {
      final dynamic datas = json.decode(response.body);
      if (datas != null) {
        List<Draw> list = [];
        List<dynamic> drawingDatas = datas["data"]["imageList"];
        for (int i = 0; i < drawingDatas.length; i++) {
          var draw = Draw(
              name: drawingDatas[i]["name"], figure: drawingDatas[i]["figure"]);
          list.add(draw);
        }
        PageStorage.of(context).writeState(context, list, identifier: id);
        setState(() {
          _list = list;
        });
      }
    }).catchError((Object error) {
      print("error");
    });
  }

}
