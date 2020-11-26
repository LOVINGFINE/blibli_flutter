import 'dart:html';

import 'package:flutter/material.dart';

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
  int _counter = 0;
  String avatorName = '大哥';
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _setAvatorTitle(){
    setState(() {
      avatorName = '我变了';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          
          child: FloatingActionButton(
            child: Icon(
            Icons.ac_unit_sharp,
            color: Colors.green,
            size: 30.0,
            ),
            onPressed: _setAvatorTitle,
          ),
          
        ),
        title: Text(avatorName),
        actions: <Widget>[
          Center(
            child: Column(
              children:<Widget>[
                Text('一')
              ],
            ),
          ),
          Center(
            child: Text('二'),
          ),
          Center(
            child: Text('三'),
          ),
        ],
      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}
