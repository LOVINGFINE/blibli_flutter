import 'package:flutter/material.dart';

class TopNav extends StatefulWidget {
  // 状态管理类
  TopNav({Key key, @required this.nav, @required this.handleNav})
      : super(key: key);
  final nav;
  final Function(int e) handleNav;
  @override
  _TopNav createState() {
    return new _TopNav();
  }
}

// 状态类
class _TopNav extends State<TopNav> with SingleTickerProviderStateMixin {
  // 获取绑定的 状态类的数据
  // 使用 widget.变量名 来获取
  // with AutomaticKeepAliveClientMixin  用于保持 当前状态 还需要定义一个函数 bool get     wantKeepAlive => true;
  List<Map> list = [
    {'title': '推荐', 'key': '111'},
    {'title': '直播', 'key': '222'},
    {'title': '推荐', 'key': '111'},
    {'title': '直播', 'key': '222'},
    {'title': '推荐', 'key': '111'},
    {'title': '直播', 'key': '222'},
    {'title': '推荐', 'key': '111'},
    {'title': '直播', 'key': '222'},
    {'title': '推荐', 'key': '111'},
    {'title': '直播', 'key': '222'},
    {'title': '推荐', 'key': '111'},
    {'title': '直播', 'key': '222'},
  ];
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(
        initialIndex: widget.nav, length: list.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // final width = window.physicalSize.width;
    return Container(
        height: 30.0,
        color: Colors.blue[100],
        child: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: list.asMap().keys.map((int index) {
            Map item = list[index];
            return Container(
                child: Center(
              child: Text(item['title']),
            ));
          }).toList(),
          onTap: (int i) {
            widget.handleNav(i);
          },
        ));
  }
}
