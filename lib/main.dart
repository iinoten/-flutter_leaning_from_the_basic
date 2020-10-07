import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterDemo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => FirstPage(),
        '/second': (context) => SecondPage("Routeで指定"),
      },
    );
  }
}

class FirstPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Page')),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/second'); //routeでルーティング
          },
          child: Text('Next Page'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String messageFromFirst;
  SecondPage(this.messageFromFirst); // 引数の登録 引数をrequired
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(messageFromFirst)),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop<String>(context, 'SecondPageから戻った'); // popで戻る際にデータを渡す
          },
          child: Text('Go Back'),
        ),
      ),
    );
  }
}