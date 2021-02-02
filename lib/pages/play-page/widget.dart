import 'package:blibli_flutter/utils/utils.dart';
import 'package:flutter/material.dart';

class PlayPage extends StatefulWidget {
  // 状态管理类
  PlayPage({
    Key key,
    @required this.param,
  }) : super(key: key);
  final String param;
  @override
  _PlayPage createState() {
    return new _PlayPage();
  }
}

// 状态类
class _PlayPage extends State<PlayPage> {
  // 获取绑定的 状态类的数据
  // 使用 weiget.变量名 来获取
  // with AutomaticKeepAliveClientMixin  用于保持 当前状态 还需要定义一个函数 bool get     wantKeepAlive => true;
  String playUrl = '';
  @override
  void initState() {
    super.initState();
    // print(widget.param);
    UtilsTool().generateMd5(widget.param);
    playUrl = UtilsTool().generateMd5(widget.param);
    // print(playUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('播放组件'),
    );
  }
}
