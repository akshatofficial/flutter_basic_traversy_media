import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random().asPascalCase;

    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.purpleAccent[700]),
        home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  Widget _buildList() {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 50,
          color: Colors.grey[400],
          child: Text("WordPair 1"),
        ),
        Container(
          height: 50,
          color: Colors.grey[400],
          child: Text("WordPair 2"),
        ),
        Container(
          height: 50,
          color: Colors.grey[400],
          child: Text("WordPair 3"),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("WordPair Generator"),
        ),
      ),
      body: _buildList(),
    );
  }
}
