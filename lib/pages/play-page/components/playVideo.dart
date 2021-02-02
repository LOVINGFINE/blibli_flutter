import 'package:flutter/material.dart';

class PlayBox extends StatefulWidget {
  // 状态管理类
  PlayBox({Key key, this.state}) : super(key: key);
  final Object state;
  @override
  _PlayBox createState() {
    return new _PlayBox();
  }
}

// 状态类
class _PlayBox extends State<PlayBox> {
  // 获取绑定的 状态类的数据
  // 使用 weiget.变量名 来获取
  // with AutomaticKeepAliveClientMixin  用于保持 当前状态 还需要定义一个函数 bool get     wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            bottom: 0,
            child: Opacity(
              opacity: 0.4,
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 35.0,
                child: Column(children: [Text('控制器')]),
              ),
            ))
      ],
    );
  }
}
