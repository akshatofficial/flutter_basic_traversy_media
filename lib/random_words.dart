import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _randomWordPairs = <WordPair>[];
  final _savedWordPairs = Set<WordPair>();

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, item) {
        if (item.isOdd) return Divider();

        final idx = item ~/ 2;

        if (idx >= _randomWordPairs.length) {
          _randomWordPairs.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_randomWordPairs[idx]);
      },
    );
  }

  Widget _buildRow(WordPair wordPair) {
    final alreadySaved = _savedWordPairs.contains(wordPair);

    return ListTile(
      title: Text(wordPair.asPascalCase, style: TextStyle(fontSize: 18.0)),
      trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _savedWordPairs.remove(wordPair);
          } else {
            _savedWordPairs.add(wordPair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _savedWordPairs.map((WordPair pair) {
        return ListTile(
          title: Text(pair.asPascalCase, style: TextStyle(fontSize: 16.0)),
        );
      });

      final List<Widget> dividedListTiles =
          ListTile.divideTiles(tiles: tiles, context: context).toList();

      return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text("Saved WordPairs"),
            ),
          ),
          body: ListView(children: dividedListTiles));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("WordPair Generator"),
        ),
        actions: <Widget>[
          IconButton(onPressed: _pushSaved, icon: Icon(Icons.list))
        ],
      ),
      body: _buildList(),
    );
  }
}
