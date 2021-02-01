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
    print(i);
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
    return Column(
      children: [
        TopNav(
          nav: nav,
          handleNav: (e) {
            handleNav(e);
          },
        ),
        Container(
          height: 600,
          child: switchWidget(),
        )
      ],
    );
  }
}
