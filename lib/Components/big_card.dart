import 'package:clothesmatch/Services/database_service.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;
  final DatabaseService databaseService = DatabaseService();

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
            StreamBuilder(
              stream: databaseService.getListings(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Text('Loading...');
                  default:
                    if (snapshot.hasData) {
                      List listings = snapshot.data?.docs ?? [];
                      print(listings);
                      if (listings.isEmpty) {
                        return Text('No listings found');
                      }
                      return Text("hi");
                    } else {
                      return Text('No data');
                    }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

/*
            StreamBuilder(
                stream: databaseService.getListings(),
                builder: (context, snapshot) {
                  List listings = snapshot.data?.docs ?? [];
                  if (listings.isEmpty) {
                    return Text('No listings found');
                  }
                  print(listings);
                  return Text("hi");
                })
*/