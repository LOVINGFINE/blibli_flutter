import 'package:flutter/material.dart';
import 'models/recommend.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> list = new List();
  @override
  void initState() {
    super.initState();
    this.getdataList();
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            var _data = this.list[index];
            return ListTile(
                leading: Image.network(_data["cover"]),
                title: Text(_data["title"]),
                subtitle: Text(_data["tname"] + _data["name"]),
                trailing: Icon(Icons.chevron_right));
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount:
              10), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
