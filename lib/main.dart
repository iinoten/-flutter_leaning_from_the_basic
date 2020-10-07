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
      home: FirstPage(),
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
            Navigator.push(context,
              MaterialPageRoute(
                builder: (context) {
                  return SecondPage('messageFromFirst'); //push先に引数を渡す
                },
                fullscreenDialog: true // これでダイアログになる
              ),
            );
          },
          child: Text('Next Page'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String messageFromFirst;
  SecondPage(this.messageFromFirst); // 引数の登録
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(messageFromFirst)),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go Back'),
        ),
      ),
    );
  }
}