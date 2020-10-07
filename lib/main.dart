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
        '/second': (context) => SecondPage(),
      },
    );
  }
}

class FirstPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Page')),
      body: Center(
        child: Column(
          children:<Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/second',
                  arguments: 'Image'
                ); //routeでルーティング
              },
              child: Text('Next Page'),
            ),
            Image.asset(
              'images/Icon.jpg',
              fit: BoxFit.contain,
            ), // アプリ内のバンドルされた画像を表示
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var messageFromFirst = ModalRoute.of(context).settings.arguments; // ModalRoute を利用して遷移元からのデータを受けとる
    return Scaffold(
      appBar: AppBar(title: Text(messageFromFirst)),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.pop<String>(context, 'SecondPageから戻った'); // popで戻る際にデータを渡す
            },
            child: Text('Go Back'),
          ),
          Image.network('https://pbs.twimg.com/profile_banners/3230712428/1597905079/1500x500'), //  ネットワークURL指定の画像表示
        ] 
      ),
    );
  }
}