import 'package:flutter/material.dart';
import 'package:blibli_flutter/models/recommend.dart';
import '../play-page/widget.dart';

class Recommend extends StatefulWidget {
  // 状态管理类
  Recommend({Key key, this.state}) : super(key: key);
  final Object state;
  @override
  _Recommend createState() {
    return new _Recommend();
  }
}

// 状态类
class _Recommend extends State<Recommend> {
  List<dynamic> list = new List();
  @override
  void initState() {
    super.initState();
    this.getdataList(); // 获取推荐列表
  }

  void getdataList() {
    RecommendData().getRecList().then((value) {
      this.setState(() {
        list = value;
      });
    });
  }

  void toDetail(int index) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx) {
      return PlayPage(param: list[index]['param']);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 210.0,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 0.90,
          ),
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.only(
                  top: 20.0,
                  left: index % 2 == 0 ? 10.0 : 0,
                  right: index % 2 != 0 ? 10.0 : 0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3.0)),
                child: Column(children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      toDetail(index);
                    },
                    child: Image.network(
                      list[index]['cover'],
                      height: 130.0,
                      repeat: ImageRepeat.repeatY,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 6.0),
                            child: Text(
                              list[index]['title'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.0,
                                height: 1.3,
                              ),
                            )),
                        Positioned(
                            left: 12.0,
                            bottom: 6.0,
                            child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.pink[300],
                                    borderRadius: BorderRadius.circular(3.0)),
                                width: 60,
                                child: Text(
                                  list[index]['tname'] == null
                                      ? '暂无分类'
                                      : list[index]['tname'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    height: 1.4,
                                  ),
                                ))),
                        Positioned(
                            right: 12.0,
                            bottom: 6.0,
                            child: Text(
                              '...',
                              style: TextStyle(
                                  color: Colors.black,
                                  height: 1.4,
                                  fontSize: 20.0),
                            ))
                      ],
                    ),
                  )
                ]),
              ),
            );
          }, childCount: list.length),
        )
      ],
    );
  }
}
