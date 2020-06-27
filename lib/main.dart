import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_lib_app/models/info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Info(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: PageOne(),
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(child: Top()),
          Flexible(child: Bottom()),
        ],
      ),
    );
  }
}

class Top extends StatelessWidget {
  const Top({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Info info = Provider.of<Info>(context);
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                info.changeTitle("New Title");
                info.changeDescription("My new description");
              },
              child: Text("Chanage Value"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => PageTwo()));
              },
              child: Text("Next Page"),
            ),
          ],
        ),
      ),
    );
  }
}

class Bottom extends StatelessWidget {
  const Bottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var info = Provider.of<Info>(context);
    return Container(
      child: Center(
        child: RichText(
            text: TextSpan(style: TextStyle(color: Colors.black), children: [
          TextSpan(
              text: info.title, style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: " "),
          TextSpan(text: info.description),
        ])),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Info info = Provider.of<Info>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: RichText(
              text: TextSpan(style: TextStyle(color: Colors.black), children: [
            TextSpan(
                text: info.title,
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: " "),
            TextSpan(text: info.description),
          ])),
        ),
      ),
    );
  }
}
