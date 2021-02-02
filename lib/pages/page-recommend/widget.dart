import 'package:flutter/material.dart';
// 顶部 tab
import './components/topNav.dart';

// 子视图
import './recommend.dart';

class SwitchPage extends StatefulWidget {
  SwitchPage({Key key}) : super(key: key);
  @override
  _SwitchPage createState() => _SwitchPage();
}

class _SwitchPage extends State<SwitchPage> {
  int nav = 0;
  void handleNav(int i) {
    nav = i;
  }

  Widget switchWidget() {
    switch (nav) {
      case 0:
        return Recommend();
        break;
      default:
        return Recommend();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey[200]),
        child: Column(
          children: [
            TopNav(
              nav: nav,
              handleNav: (e) {
                handleNav(e);
              },
            ),
            Expanded(
                child: Container(
              child: switchWidget(),
            ))
          ],
        ));
  }
}
