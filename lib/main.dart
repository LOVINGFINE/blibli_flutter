import 'package:flutter/material.dart';
import 'pages/page-recommend/widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // 状态管理类
  MyApp({Key key}) : super(key: key);
  @override
  _MyApp createState() {
    return new _MyApp();
  }
}

// 状态类
class _MyApp extends State<MyApp> with TickerProviderStateMixin {
  TabController _controller; //tab控制器
  @override
  void initState() {
    super.initState();
    //初始化controller并添加监听
    _controller = TabController(initialIndex: 0, length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('blibli'),
          ),
          body: TabBarView(
            controller: _controller,
            children: <Widget>[
              SwitchPage(),
              Text('ddd'),
              Text('ddd'),
              Text('ddd'),

            ],
          ),
          bottomNavigationBar: Container(
            // 底部导航栏 使用Container 控制大小
            decoration: BoxDecoration(
              // Container 裝飾組件
              color: Colors.blueGrey[100],
            ),
            height: 80, // 高度 一般都是50
            child: TabBar(
              // TabBar 組件  需要在MaterialApp的body屬性中指定，對應容器,
              controller: _controller,
              labelStyle: TextStyle(height: 0, fontSize: 10), // 標簽文字樣式設置
              tabs: <Widget>[
                // tabs 屬性是一個數組類型 ，返回元素的 派生類是 weiget
                Tab(
                    icon: Icon(Icons.my_location),
                    text:
                        '发现'), // icon 屬性是 字體圖標，需要返回一個Icon組件提供,Icons構造函數中包含字體圖標
                Tab(
                  icon: Icon(Icons.pages),
                  text: '推荐',
                ),
                Tab(
                  icon: Icon(Icons.movie_filter),
                  text: '视频',
                ),
                Tab(
                  icon: Icon(Icons.rotate_right),
                  text: '榜单',
                ),
              ],
            ),
          ),
        ));
  }
}
