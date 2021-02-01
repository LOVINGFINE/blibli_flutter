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
    list = [];
    this.getdataList(); // 获取推荐列表
  }

  void getdataList() {
    RecommendData().getRecList().then((value) {
      this.setState(() {
        list = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return list.length==0?Text('加载中...'):ListView.separated(
        itemBuilder: (context, index) {
          var _data = this.list[index];
          return GestureDetector(
              child: ListTile(
                  leading: Image.network(_data["cover"]),
                  title: Text(_data["title"]),
                  subtitle: Text(_data["tname"]),
                  trailing: Icon(Icons.chevron_right)),
              onTap: () {
                Navigator.push(context, // 这里使用Navigator.push 方法
                    MaterialPageRoute(builder: (BuildContext ctx) {
                  return PlayPage(
                      idx: _data['idx']); // builder 方法需要一个 weiget作为返回值
                }));
              });
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: this.list.length);
  }
}
