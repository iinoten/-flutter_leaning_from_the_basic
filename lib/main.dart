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
        '/container': (context) => ContainerPage(),
        '/multiChildLayout': (context) => MultiChildLayout(),
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
      body: Center(
        child: SingleChildScrollView(  // スクロールできるようにした
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/container',
                    arguments: 'Image'
                  ); //routeでルーティング
                },
                child: Text('Go Back'),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue)
                ),
                margin: const EdgeInsets.all(10.0),
                height: 300,
                width: 300,
                child: Image.network(
                  'https://pbs.twimg.com/profile_banners/3230712428/1597905079/1500x500',
                  fit: BoxFit.contain,  //親ウィジェットにサイズを合わせて可能な限り大きく
                  gaplessPlayback: true,  // 画像が変更される時に、新しい画像が読みこまれるまで古い画像が残ってくれる

                ), //  ネットワークURL指定の画像表示,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue)
                ),
                margin: const EdgeInsets.all(10.0),
                height: 300,
                width: 300,
                child: Image.network(
                  'https://pbs.twimg.com/profile_banners/3230712428/1597905079/1500x500',
                  fit: BoxFit.fill,  //縦横比を変えて親ウィジェットの大きさにする
                ), 
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue)
                ),
                margin: const EdgeInsets.all(10.0),
                height: 300,
                width: 300,
                child: Image.network(
                  'https://pbs.twimg.com/profile_banners/3230712428/1597905079/1500x500',
                  fit: BoxFit.fitHeight,  //親ウィジェットの高さに合わせる
                ), 
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue)
                ),
                margin: const EdgeInsets.all(10.0),
                height: 300,
                width: 300,
                child: Image.network(
                  'https://pbs.twimg.com/profile_banners/3230712428/1597905079/1500x500',
                  fit: BoxFit.fitWidth,  //親ウィジェットの幅に合わせる
                ), 
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue)
                ),
                margin: const EdgeInsets.all(10.0),
                height: 300,
                width: 300,
                child: Image.network(
                  'https://pbs.twimg.com/profile_banners/3230712428/1597905079/1500x500',
                  fit: BoxFit.cover,  //親ウィジェットの高さと幅を比較して画像が埋まる方に合わせる
                ), 
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue)
                ),
                margin: const EdgeInsets.all(10.0),
                height: 300,
                width: 300,
                child: Image.network(
                  'https://pbs.twimg.com/profile_banners/3230712428/1597905079/1500x500',
                  fit: BoxFit.none,  //画像のサイズは変えずに真ん中に配置する
                ), 
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue)
                ),
                margin: const EdgeInsets.all(10.0),
                height: 300,
                width: 300,
                child: Icon(
                  Icons.insert_emoticon, //アイコンを表示
                  size: 100,
                  color: Colors.pink,
                ),
              ),
            ] 
          ),
        ),
      )
    );
  }
}

class ContainerPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/multiChildLayout',
                arguments: 'Image'
              ); //routeでルーティング
            },
          ),
          Container(
            padding: EdgeInsets.all(8.0), // paddingを付ける
            margin: EdgeInsets.all(8.0), // Marginを付ける
            transform: Matrix4.rotationZ(0.1),  // 傾ける
            width: 300,
            height: 300,
            child: Text('Container'),
            decoration: BoxDecoration(
              color: Colors.white, // BoxDecolationの外でcolorを指定してたらエラーになる
              border: Border.all(color: Colors.greenAccent, width: 10),
              shape: BoxShape.rectangle,  // 丸くできる
              boxShadow: [
                BoxShadow(blurRadius: 100),
              ],
              gradient: LinearGradient( // グラデーションが作れる
                colors: [
                  Colors.yellow,
                  Colors.black
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MultiChildLayout extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MultiChildLayout')
        ),
        body: Container(
          alignment: Alignment.center,
          width: 100,
          color: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end, // 横幅が他とは違うものがあったときにどう合わせるかのプロパティ。startで大きいものの終了地点に合わせる
            children: <Widget>[
              MyConteiner(),
              MyConteiner(size: 70),
              MyConteiner(),
            ],
          )
        ),
      ),
    );
  }
}
Container MyConteiner({double size = 50}) {
  return Container(
    margin: const EdgeInsets.all(8),
    height: size,
    width: size,
    color: Colors.black,
  );
}
