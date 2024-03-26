import 'package:clothesmatch/Components/big_card.dart';
import 'package:clothesmatch/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('A random cool idea:'),
            Dismissible(
                key: Key(pair.toString()),
                onDismissed: (direction) {
                  if (direction == DismissDirection.startToEnd) {
                    appState.togglefavorite();
                    appState.getNext();
                  } else {
                    appState.getNext();
                  }
                },
                child: BigCard(pair: pair)),
            /*
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    appState.togglefavorite();
                  },
                  icon: Icon(appState.favorites.contains(pair)
                      ? Icons.favorite
                      : Icons.favorite_border),
                  label: Text('Like'),
                ),
                ElevatedButton(
                  onPressed: () {
                    appState.getNext();
                  },
                  child: Text('Next'),
                ),
              ],
            ),
            */
          ],
        ),
      ),
    );
  }
}
