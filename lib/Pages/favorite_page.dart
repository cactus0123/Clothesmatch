import 'package:clothesmatch/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.favorite), text: 'Matched'),
              Tab(icon: Icon(Icons.favorite_border), text: 'Unmatched'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            appState.centerPage(const Text("You have no matches yet.")),
            ListView(
              children: appState.favorites
                  .map((pair) => ListTile(
                        title: Text(pair.asLowerCase),
                        leading: Icon(Icons.favorite),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
/*
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),

      ],
    );
*/
  }
}
