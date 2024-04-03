import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayLarge!
        .copyWith(color: theme.colorScheme.onPrimary);

    return Center(
      child: Card(
        color: theme.colorScheme.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                image: NetworkImage(
                    'https://m.media-amazon.com/images/I/51IVI1u5mFL._AC_UY1000_.jpg'),
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.6),
            Text(
              pair.asPascalCase,
              style: style,
              semanticsLabel: "${pair.first} ${pair.second}",
            ),
          ],
        ),
      ),
    );
  }
}
/*
child: Scaffold(
            body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                pair.asPascalCase,
                style: style,
                semanticsLabel: "${pair.first} ${pair.second}",
              ),
            ],
          ),
        )),
        */