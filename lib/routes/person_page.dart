import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonPage extends StatefulWidget {
  PersonPage({Key key}) : super(key: key);

  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  List<PersonItem> items = [];

  @override
  void initState() {
    items.add(
        PersonItem(name: "收藏", image: Image.asset("imgs/ic_favourites.png")));
    items
        .add(PersonItem(name: "我的作品", image: Image.asset("imgs/ic_works.png")));
    items.add(
        PersonItem(name: "商店", image: Image.asset("imgs/ic_inttegral.png")));
    items.add(PersonItem(name: "设置", image: Image.asset("imgs/ic_seting.png")));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 200,
              color: Colors.green,
              child: Center(
                child: ClipOval(
                  child: Image.asset(
                    "imgs/ic_person.png",
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 20,
              child: Text(
                "Person",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            )
          ],
        ),
        Container(
          height: 55,
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.grey[500]))),
          child: Row(
            children: <Widget>[
              Image.asset(
                "imgs/ic_favourites.png",
                height: 30,
                width: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "我的收藏",
                ),
              )
            ],
          ),
        ),
        Container(
          height: 55,
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 0.5, color: Colors.grey[500]))),
          child: Row(
            children: <Widget>[
              Image.asset(
                "imgs/ic_works.png",
                height: 30,
                width: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "作品",
                ),
              )
            ],
          ),
        ),
        Container(
          height: 55,
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.grey[500]))),
          child: Row(
            children: <Widget>[
              Image.asset(
                "imgs/ic_integral.png",
                height: 30,
                width: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "商店",
                ),
              )
            ],
          ),
        ),
        Container(
          height: 55,
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.grey[500]))),
          child: Row(
            children: <Widget>[
              Image.asset(
                "imgs/ic_seting.png",
                height: 30,
                width: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "设置",
                ),
              )
//        Container(
//          padding: EdgeInsets.only(left: 20),
//          child: Text(
//            "设置",
//          ),
//        )
            ],
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 30))
      ],
    );
  }
}

class PersonItem {
  String name;
  Image image;

  PersonItem({this.name, this.image});
}
