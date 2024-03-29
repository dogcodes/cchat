import 'package:flutter/material.dart';
import 'package:cchat/chat_page.dart';
import 'package:cchat/constants/icon.dart';

import 'contact_page.dart';
import 'discover_page.dart';
import 'me_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final bodyList = [ChatPage(), ContactPage(), DiscoverPage(), MePage()];

  List<int> arr = [1, 4, 2, 6, 9, 5, 62];

  swap(List<int> arr) {
    List<int> arr1 = arr;
    int tmp = 0;

    for (int i = 0; i < arr.length; i++) {
      for (int j = i; j < arr.length; j++) {
        if (arr1[i] > arr1[j]) {
          tmp = arr1[i];
          arr1[i] = arr1[j];
          arr[j] = tmp;
        }
      }
    }
    print(arr);
    print(arr1);

    swap(arr);
  }

  _incrementCounter(int value) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter = value;
//      swap(arr);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('cchat'),
      ),
      body: IndexedStack(
        index: _counter,
        children: bodyList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _counter,
        onTap: _incrementCounter,
        // 点击里面的按钮的回调函数，参数为当前点击的按钮 index
        fixedColor: Colors.green,
        items: [
          BottomNavigationBarItem(icon: Icon(icon.wechat), title: Text('微信')),
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts), title: Text('通讯录')),
          BottomNavigationBarItem(
              icon: Icon(Icons.find_replace), title: Text('发现')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我')),
        ],
      ),
    );
  }
}
